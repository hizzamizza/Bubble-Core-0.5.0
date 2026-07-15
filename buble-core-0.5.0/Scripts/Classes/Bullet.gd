class_name Bullet
extends CharacterBody3D


func _physics_process(delta: float) -> void:
	velocity = -transform.basis.z
	velocity.y = 0
	print(position)
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var hit_target = collision_info.get_collider()
		if hit_target is TankBase:
			hit_target.kill()
