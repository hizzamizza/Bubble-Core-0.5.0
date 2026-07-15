class_name TankBase
extends CharacterBody3D


@export var move_speed : float
@export var rotate_speed : float

@export var gun : Node3D
@export var camera : Camera3D
@export var plane : MeshInstance3D

@export var shoot_point : Node3D

var gravity = 9.8
var can_shoot : bool = true
var bullet_scene : PackedScene = preload('uid://csshvi7odn0at')

var move_vector : Vector3
var aim_vector

signal move(move_vector : Vector3)
signal aim(aim_vector : Vector3)
signal shoot(shoot_input : bool)


func _ready() -> void:
	move.connect(_on_move)


func _on_move(new_vector : Vector3) -> void:
	move_vector = new_vector


func _physics_process(delta: float) -> void:
	handle_move_aim(delta)


func handle_move_aim(delta) -> void:

	if move_vector:
		var move_rotation_vector = transform.origin + move_vector
		transform = transform.interpolate_with(transform.looking_at(move_rotation_vector), rotate_speed * delta)
		transform.origin += move_vector * delta * move_speed
	
	transform.origin.y = .06 #magic number bad, should be put in a global somewhere
	move_and_slide()


func kill() -> void:
	print(self, ' i have died')