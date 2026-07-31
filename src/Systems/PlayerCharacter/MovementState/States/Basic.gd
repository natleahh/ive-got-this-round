class_name Basic extends MovementState

func enter(_old_state: MovementState) -> MovementState:
	return self

func exit(new_state: MovementState) -> MovementState:
	return new_state.enter(self)
