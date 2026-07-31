extends Node2D

@export var main: GlassSim

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	main.apply_force(direction)
	
	if Input.is_action_just_pressed("ui_accept"):
		main.reset()
