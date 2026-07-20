class_name Util
extends Node


static var DEF_Y_HEIGHT : float = 0.1
static var FRICTION : float = .06


static func random_point_on_floor() -> Vector3:
	var base_mesh = Locator.floor_mesh
	var x_offset = base_mesh.mesh.size.x/2
	var z_offset = base_mesh.mesh.size.y/2
	var x_val = randf_range(-x_offset, x_offset)
	var z_val = randf_range(-z_offset, z_offset)
	return Vector3(x_val, DEF_Y_HEIGHT, z_val)
