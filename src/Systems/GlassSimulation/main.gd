class_name GlassSim extends Node2D

signal dropped

@export var glass_wobbler: GlassWobbler
@export var inner_field: GravityField
@export var middle_field: GravityField
@export var outer_field: GravityField

func apply_force(force: Vector2) -> void:
	glass_wobbler.apply_central_force(force * (2 ** 9.5))

func reset() -> void:
	glass_wobbler.queue_free()
	glass_wobbler = GlassWobbler.new()
	add_child(glass_wobbler)

func _on_outer_field_body_exited(area: Node2D) -> void:
	if area is GlassWobbler:
		dropped.emit()
