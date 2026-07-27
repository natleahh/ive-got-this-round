extends Node

@export_category("Movement Parameters")
@export var movement_speed: float = 200

@export_category("PhysicsParameters")
@export var force_scaling: float = 1.1

var movement_direction: Vector2 = Vector2.ZERO

@export var player: CharacterBody2D
@export var simulator_ball: RigidBody2D

var is_dashing: bool = false
@export var dash_cool_down: Timer

func _physics_process(delta: float) -> void:
	# Movement Input
	var input_movement = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if is_dashing:
		pass
	elif Input.is_action_just_pressed("dash"):
		player.velocity = player.velocity * 3
		dash_cool_down.start(0.2)
		is_dashing = true
	else:
		player.velocity = input_movement * movement_speed 
		
	player.move_and_slide()


	# Physics Affect
	simulator_ball.apply_central_force(-player.velocity * force_scaling)


func _on_dash_cool_down_timeout() -> void:
	is_dashing = false
