class_name Weapon
extends CharacterBody3D


@export var tank_base : TankBase
@export var cooldown : float
@export var shoot_from : Array[Node3D]
@export var bullet_scene_path : String
var bullet_scene : PackedScene:
	get():
		if !bullet_scene:
			bullet_scene = load(bullet_scene_path)
		return bullet_scene

var can_shoot : bool = true


func _ready() -> void:
	tank_base.aim.connect(_on_aim)
	tank_base.shoot.connect(_on_shoot)


func _on_aim(new_vector : Vector3) -> void:
	look_at(new_vector)


func _on_shoot(new_val : bool) -> void:
	if new_val == true and can_shoot:
		shoot()


func shoot() -> void:
	for shoot_point in shoot_from:
		var new_bullet : CharacterBody3D = bullet_scene.instantiate()
		get_tree().root.add_child(new_bullet)
		new_bullet.transform = shoot_point.global_transform
	start_cooldown()


func start_cooldown() -> void:
	can_shoot = false
	await get_tree().create_timer(cooldown).timeout
	can_shoot = true
