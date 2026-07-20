class_name Util
extends Node


static var def_y_height = 0.06


static func random_point_on_floor() -> Vector3:
	var base_mesh = Locator.floor_mesh
	var x_offset = base_mesh.mesh.size.x/2
	var z_offset = base_mesh.mesh.size.y/2
	var x_val = randf_range(-x_offset, x_offset)
	var z_val = randf_range(-z_offset, z_offset)
	return Vector3(x_val, def_y_height, z_val)