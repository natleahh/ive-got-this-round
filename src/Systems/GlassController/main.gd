extends Node2D

@export var tilt_marker: RigidBody2D
@export var inner_field: GravityField
@export var middle_field: GravityField
@export var outer_field: GravityField

const BASE_GRAVITY: float = 980.0

var _gravity_scale: float = 1
var _middle_scale: float = -0.1
var _outer_scale: float = -0.5

@export_category("Gravity Scaling")
@export var base_gravity_scale: float:
	set(value):
		_gravity_scale = value
		set_gravity()
	get:
		return _gravity_scale

@export var middle_gravity_scale: float:
	set(value):
		_middle_scale = value
		set_gravity()
	get:
		return _middle_scale

@export var outer_gravity_scale: float:
	set(value):
		_outer_scale = value
		set_gravity()
	get:
		return _outer_scale

func _ready():
	set_gravity()

func set_gravity() -> void:
	if not is_node_ready():
		return
	inner_field.gravity = BASE_GRAVITY * _gravity_scale
	middle_field.gravity = BASE_GRAVITY * _gravity_scale * _middle_scale
	outer_field.gravity = BASE_GRAVITY * _gravity_scale * _outer_scale
