extends Node2D

@export_category("Movement Parameters")
@export var movement_speed: float = 200

@export_category("PhysicsParameters")
@export var force_scaling: float = 1.1

var movement_direction: Vector2 = Vector2.ZERO

@export var player: CharacterBody2D
@export var simulator_ball: RigidBody2D
@export var icon: Sprite2D

var is_dashing: bool = false
@export var dash_cool_down: Timer
@export var camera_2d: Camera2D


func _physics_process(delta: float) -> void:
	# Turning Input
	var input_rotation: float = player.global_position.angle_to_point(get_global_mouse_position()) + (PI / 2)
	icon.rotation = input_rotation
	camera_2d.rotation = input_rotation + PI

	
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
	simulator_ball.apply_central_force(-player.velocity.rotated(-input_rotation) * force_scaling)


func _on_dash_cool_down_timeout() -> void:
	is_dashing = false
