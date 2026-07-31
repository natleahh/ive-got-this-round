class_name Dash extends MovementState

## Cooldown time in seconds
@export_range(0, 5000, 1, "exp") var cooldown: float = 500
@export_range(0, 5000, 1, "exp") var dashtime: float = 250

@onready var cooldown_timer: CooldownTimer = CooldownTimer.cons(cooldown, self)
@onready var dashtime_timer: CooldownTimer = CooldownTimer.cons(dashtime, self)

var _just_dashed: bool = false
var constant_force: Vector2

func _ready() -> void:
	dashtime_timer.timeout.connect(_on_dashtime_timeout)

func enter(old_state: MovementState) -> MovementState:
	if not cooldown_timer.is_stopped():
		return old_state
	if dashtime_timer.is_stopped():
		_just_dashed = true
		dashtime_timer.start()
	return self

func exit(_new_state: MovementState) -> MovementState:
	if dashtime_timer.is_stopped():
		cooldown_timer.start()
	return self

func get_force(speed: float, rotation: float) -> Vector2:
	if _just_dashed:
		_just_dashed = false
		constant_force = super.get_force(speed, rotation)
	return constant_force

func _on_dashtime_timeout():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		exited.emit("Walk")
	else:
		exited.emit("Idle")
