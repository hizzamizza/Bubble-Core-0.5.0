@abstract class_name Controller
extends Node3D


@export var control_target : TankBase


var Kp : float = .4
var Kd : float = .2


@abstract func handle_inputs() -> void


func _physics_process(_delta: float) -> void:
	handle_inputs()


func pid_move_to(target : Vector3) -> void:

	var error = target - control_target.transform.origin
	var error_derivative = control_target.velocity

	var p_term = Kp * error
	var d_term = Kd * error_derivative

	var pid_output = p_term + d_term

	control_target.move.emit(pid_output)