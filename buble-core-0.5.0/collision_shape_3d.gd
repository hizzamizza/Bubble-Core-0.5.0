extends CharacterBody3D


@export var tank : CharacterBody3D
@export var speed : float

@export var gun : Node3D
@export var camera : Camera3D
@export var plane : MeshInstance3D


func _physics_process(delta: float) -> void:
	handle_inputs(delta)


func handle_inputs(delta) -> void:
	var x_total = Input.get_action_strength('right') - Input.get_action_strength('left')
	var z_total = Input.get_action_strength('up') - Input.get_action_strength('down')

	var net_vector = Vector3(x_total, 0, z_total)

	tank.position += net_vector * delta * speed

	var mouse_pos = get_mouse_position()
	look_at(mouse_pos, Vector3.UP)


func get_mouse_position() -> Vector3:
	var player_pos = global_transform.origin

	var floor_ = Plane(Vector3.UP, player_pos.y)
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_length = 1000

	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * ray_length
	

	var result = floor_.intersects_ray(from, to)


	print(result)
	return result
