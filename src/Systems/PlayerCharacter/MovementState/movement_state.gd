@abstract
class_name MovementState extends Node
	
signal exited

@export var parameters: MovementParamters
"""Common Paramters all Movement States should define."""

@onready var transform: Transform2D:
	get:
		return parameters._tranform

func enter(old_state: MovementState) -> MovementState:
	return self

func exit(new_state: MovementState) -> void:
	exited.emit(new_state)
