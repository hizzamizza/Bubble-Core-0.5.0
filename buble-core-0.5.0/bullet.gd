extends CharacterBody3D


func _physics_process(delta: float) -> void:
	velocity = -transform.basis.z
	move_and_slide()