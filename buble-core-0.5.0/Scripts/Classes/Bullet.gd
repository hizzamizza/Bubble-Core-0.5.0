class_name Bullet
extends CharacterBody3D


func _physics_process(_delta: float) -> void:
	velocity = -transform.basis.z
	move_and_slide()