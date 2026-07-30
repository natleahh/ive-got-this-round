class_name Dash extends MovementState

## Cooldown time in seconds
@export_range(0, 5000, 1, "exp") var cooldown: float = 500
@export_range(0, 5000, 1, "exp") var dashtime: float = 250

@onready var cooldown_timer: Timer = _setup_timer()
@onready var dashtime_timer: Timer = _setup_timer()

var _just_dashed: bool = false
var constant_force: Vector2

func _ready() -> void:
	cooldown_timer.wait_time = cooldown / 1000.0
	dashtime_timer.wait_time = dashtime / 1000.0
	dashtime_timer.timeout.connect(_on_dashtime_timeout)


func _setup_timer() -> Timer:
	var timer = Timer.new()
	add_child(timer)
	return timer
	
func enter(old_state: MovementState) -> MovementState:
	if cooldown_timer.wait_time > 0:
		return old_state
	if dashtime_timer.is_stopped():
		_just_dashed = true
		dashtime_timer.start(dashtime)
	return self

func exit(_new_state: MovementState) -> MovementState:
	if dashtime_timer.is_stopped():
		cooldown_timer.start(cooldown)
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
		
