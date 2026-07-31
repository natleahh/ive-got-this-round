@tool
class_name GravityField extends Area2D

const BASE_GRAVITY: float = 980.0

@export var shape: CircleShape2D:
	set(value):
		collision_shape.shape = value
	get:
		return collision_shape.shape

@export var debug_color: Color:
	get:
		return collision_shape.debug_color
	set(value):
		collision_shape.debug_color = value

@export var relative_gravity: float:
	set(value):
		relative_gravity = value
		gravity = BASE_GRAVITY * relative_gravity

var collision_shape: CollisionShape2D

class _CollisionShape2D extends CollisionShape2D:
	func _init() -> void:
		shape = CircleShape2D.new()
		
	static func cons(parent: GravityField) -> CollisionShape2D:
		var cs = _CollisionShape2D.new()
		parent.add_child(cs)
		return cs


func _init() -> void:
	collision_shape = _CollisionShape2D.cons(self)
	gravity_space_override = Area2D.SPACE_OVERRIDE_REPLACE
	gravity_point = true
	gravity_point_center = Vector2.ZERO
	
	
	
