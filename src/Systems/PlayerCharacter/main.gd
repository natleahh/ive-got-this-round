extends RigidBody2D

var facing_direction: Vector2


@export var base_speed: float = 1.0 * (2 ** 10)
	
var screen_position: Vector2:
	get:
		return get_global_transform_with_canvas() * position
		

@export var player_sprite: Sprite2D
@export var movement_state_machine: MovementStateMachine
@export var initial_state: MovementState

@onready var current_state: MovementState = initial_state

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
			facing_direction = screen_position.direction_to(
				event.position
			)
			#print(event.position)
	if event is InputEventMouseButton and (event as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT:
		var new_state: Variant
		if event.is_released():
			new_state = "Idle"
		else:
			new_state = "Walk"
		movement_state_machine.change_state(new_state)
		

func _process(delta: float) -> void:
	player_sprite.rotation = facing_direction.angle()

func _physics_process(delta: float) -> void:
	apply_central_force(facing_direction * current_state.transform * base_speed)


func _on_movement_state_machine_changed_state(new: MovementState) -> void:
	current_state = new
