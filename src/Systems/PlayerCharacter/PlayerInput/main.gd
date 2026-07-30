class_name PlayerInput extends Node2D

signal action_changed(state_name: String)

var action: String = "Idle":
	set(val):
		if action == val:
			return
		action = val
		action_changed.emit(val)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		handle_mouse_motion(event)
	if event is InputEventMouseButton:
		handle_mouse_button(event)

func handle_mouse_motion(event: InputEventMouseMotion) -> void:
	var mouse_world_position = event.position * get_canvas_transform()
	look_at(mouse_world_position)

func handle_mouse_button(event: InputEventMouseButton) -> void:
	if event.button_index != MOUSE_BUTTON_LEFT:
		return
	elif event.is_released():
		action = "Idle"
	else:
		action = "Walk"
