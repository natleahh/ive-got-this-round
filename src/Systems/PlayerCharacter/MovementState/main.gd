class_name MovementStateMachine extends Node

signal changed_state(new: MovementState)

var StateMap: Dictionary[String, MovementState] = {}

@export var initial_state: MovementState
 
@onready var current_state: MovementState = initial_state: 
	set(value):
		if value == current_state:
			return
		changed_state.emit(value)
		current_state = value
	get:
		return current_state
		
func _ready() -> void:
	for child in get_children():
		(child as MovementState).exited.connect(_on_exit)
		StateMap[child.name] = child
	changed_state.emit(initial_state)

func change_state(new_state) -> void:
	current_state.exit(StateMap[new_state])

func _on_exit(new_state: MovementState) -> void:
	current_state = new_state.enter(new_state)
	
	
	
