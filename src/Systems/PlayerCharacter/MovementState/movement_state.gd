@abstract
class_name MovementState extends Node

## Emitted when a state should immediately exit to an state
@warning_ignore("unused_signal")
signal exited(state_name: String)

@export var parameters: MovementParamters
"""Common Paramters all Movement States should define."""

## Checks if state can be entered and returns the next state
@abstract
func enter(old_state: MovementState) -> MovementState

## Checks if state can be exited and returns the next state
@abstract
func exit(new_state: MovementState) -> MovementState

## Returns the force of a state based on its movement paramters
func get_force(speed: float, rotation: float) -> Vector2:
	return speed * parameters.speed * Vector2.RIGHT.rotated(rotation + parameters.rotation)
	
