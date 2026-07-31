@tool
class_name GlassSim extends Node2D

@export var tilt_marker: RigidBody2D
@export var inner_field: GravityField
@export var middle_field: GravityField
@export var outer_field: GravityField

@export_category("Gravity Scaling")
@export var base_gravity_scale: float:
	set(value):
		base_gravity_scale = value
		update_fields()

@export var middle_gravity_scale: float:
	set(value):
		middle_gravity_scale = value
		update_fields()

@export var outer_gravity_scale: float:
	set(value):
		outer_gravity_scale = value
		update_fields()

func update_fields() -> void:
	inner_field.relative_gravity = base_gravity_scale
	middle_field.relative_gravity = base_gravity_scale * middle_gravity_scale
	outer_field.relative_gravity = base_gravity_scale * outer_gravity_scale

func apply_force(force: Vector2) -> void:
	tilt_marker.apply_central_force(force)
