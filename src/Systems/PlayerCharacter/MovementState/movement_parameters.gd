@tool
class_name MovementParamters extends Resource
var _tranform: Transform2D

@export_range(-10, 10) var relative_speed: float = 1:
	set(val):
		relative_speed = val
		_update_transform()


@export_enum("FOWARD", "BACK", "LEFT", "RIGHT") var direction: int:
	set(val):
		direction = val
		_update_transform()
func _init() -> void:
	_update_transform()

func _update_transform():
	_tranform = Transform2D(
		PI / 2 * direction,
		Vector2.ONE * relative_speed,
		1,
		Vector2.ZERO
	)
