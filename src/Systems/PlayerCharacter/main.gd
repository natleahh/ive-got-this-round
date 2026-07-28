extends Node2D

var facing_direction: Vector2
var is_moving: bool

@export var base_speed: float = 1.0 * (2 ** 10)

var _current_speed: float
@export var current_speed: float:
	set(value):
		_current_speed = current_speed * (1 if is_moving else 2)
	get:
		return _current_speed

@export var player_sprite: Sprite2D
@export var player_body: RigidBody2D

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
			facing_direction = player_body.global_position.direction_to(
				event.global_position
			)
	if event is InputEventMouseButton:
			is_moving = event.button_index == MouseButton.MOUSE_BUTTON_LEFT

func _process(delta: float) -> void:
	player_sprite.rotation = facing_direction.angle()

func _physics_process(delta: float) -> void:
	current_speed = base_speed
	player_body.apply_central_force(facing_direction * current_speed)
