extends Node

@export_category("Movement Parameters")
@export var movement_speed: float 

@export_category("PhysicsParameters")
@export var force_scaling: float = 1.2

var movement_direction: Vector2 = Vector2.ZERO

@export var player: CharacterBody2D
@export var simulator_ball: RigidBody2D

func _physics_process(delta: float) -> void:
	# Movement Input
	var input_movement = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player.velocity = input_movement * movement_speed 
	player.move_and_slide()
	
	# Physics Affect
	simulator_ball.apply_central_force(-player.velocity * force_scaling)
