class_name CooldownTimer extends Timer

func _init() -> void:
	autostart = false
	one_shot = true

static func cons(milliseconds: float, parent: Node) -> CooldownTimer:
	var timer = CooldownTimer.new()
	timer.wait_time = milliseconds / 1000.0
	parent.add_child(timer)
	return timer
