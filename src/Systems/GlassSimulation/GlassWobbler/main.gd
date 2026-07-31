@tool
class_name GlassWobbler extends RigidBody2D

const BASE_SIZE: float = 50

var collision_shape: CollisionShape2D

class _GlassShape extends CollisionShape2D:
	
	func _init() -> void:
		self.shape = CircleShape2D.new()
		self.shape.radius = BASE_SIZE
	
	static func cons(parent: GlassWobbler) -> CollisionShape2D:
		var cs = _GlassShape.new()
		parent.add_child(cs)
		return cs

func _init() -> void:
	var collision_shape = _GlassShape.cons(self)
