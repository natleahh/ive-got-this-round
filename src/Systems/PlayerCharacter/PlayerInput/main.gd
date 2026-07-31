class_name PlayerInput extends Node2D

signal action_changed(state_name: String)

var action: String = "Idle":
	set(val):
		if action == val:
			return
		action = val
		action_changed.emit(val)

var mouse_world_position

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		handle_mouse_motion(event)
	if event is InputEventMouseButton:
		handle_mouse_button(event)

func handle_mouse_motion(event: InputEventMouseMotion) -> void:
	mouse_world_position = event.position * get_canvas_transform()
	look_at(mouse_world_position)

func handle_mouse_button(event: InputEventMouseButton) -> void:
	if event.button_index != MOUSE_BUTTON_LEFT:
		return
	elif event.is_released():
		action = "Idle"
	else:
		action = "Walk"

func _process(_delta: float) -> void:
	handle_key_input()

func handle_key_input() -> void:
	var input_dash = Input.get_vector("B_Dash", "F_Dash", "L_Dash", "R_Dash")
	match _get_absolute_dash(input_dash):
		Vector2.RIGHT:
			action = "F_Dash"
		Vector2.UP:
			action = "L_Dash"
		Vector2.LEFT:
			action = "B_Dash"
		Vector2.DOWN:
			action = "R_Dash"
		
func _get_absolute_dash(input_dash: Vector2) -> Vector2:
	return input_dash.rotated(-rotation).round()
