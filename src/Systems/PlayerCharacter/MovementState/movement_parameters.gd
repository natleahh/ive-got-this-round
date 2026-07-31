@tool
class_name MovementParamters extends Resource

enum Direction {F = 0, R = 1, B = 2, L = 3}
@export var direction: Direction = Direction.F
@export var rotation: float:
	get:
		return (direction as int) * (PI / 2)

@export_range(-10, 10) var speed: float = 1
