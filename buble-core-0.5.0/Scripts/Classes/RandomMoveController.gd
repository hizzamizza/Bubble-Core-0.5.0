class_name RandMoveController
extends Controller


var move_target : Vector3


func handle_inputs() -> void:

	if !move_target:
		move_target = Util.random_point_on_floor()

	pid_move_to(move_target)

	var distance_to = control_target.transform.origin.distance_to(move_target)

	if distance_to <= 1:
		move_target = Util.random_point_on_floor()