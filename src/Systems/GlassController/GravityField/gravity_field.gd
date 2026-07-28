@tool
class_name GravityField extends Area2D
@export var collision_shape_2d: CollisionShape2D

@export_category("ShapeParams")
@export var shape: CircleShape2D:
	set(value):
		collision_shape_2d.shape = value
	get:
		return collision_shape_2d.shape

@export var color: Color = Color(0.0, 0.6, 0.702, 0.42):
	set(value):
		collision_shape_2d.debug_color = color
	get:
		return collision_shape_2d.debug_color
