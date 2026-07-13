class_name PlayerController
extends Controller


func _ready() -> void:
	Locator.player = control_target


func _physics_process(_delta: float) -> void:
	handle_inputs()


func handle_inputs() -> void:
	var x_total = Input.get_action_strength('right') - Input.get_action_strength('left')
	var z_total = Input.get_action_strength('down') - Input.get_action_strength('up')

	var net_vector = Vector3(x_total, 0, z_total)
	control_target.move.emit(net_vector)

	var aim_vector = get_mouse_position()
	control_target.aim.emit(aim_vector)

	if Input.is_action_pressed('shoot'):
		control_target.shoot.emit(true)
	else: control_target.shoot.emit(false)


func get_mouse_position() -> Vector3:
	var player_pos = global_transform.origin

	var floor_ = Plane(Vector3.UP, player_pos.y)
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_length = 1000

	var camera = get_viewport().get_camera_3d()
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * ray_length
	
	var result = floor_.intersects_ray(from, to)

	return result
