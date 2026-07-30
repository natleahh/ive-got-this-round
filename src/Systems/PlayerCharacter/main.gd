extends RigidBody2D

@export var base_speed: float = 1.0 * (2 ** 12)

var current_state: MovementState

@export var player_sprite: Sprite2D
@export var movement_state_machine: MovementStateMachine
@export var player_input: PlayerInput

func _process(_delta: float) -> void:
	player_sprite.rotation = player_input.rotation

func _physics_process(_delta: float) -> void:
	var force = current_state.get_force(base_speed, player_input.rotation)
	apply_central_force(force)

func _on_movement_state_machine_changed_state(new: MovementState) -> void:
	current_state = new
	print(new)

func _on_player_input_action_changed(state_name: String) -> void:
	movement_state_machine.change_state(state_name)
