class_name Bullet
extends CharacterBody3D

@export_range(1,10,.5) var speed : float = 2
@export var damage : int = 1


func _physics_process(delta: float) -> void:
	velocity = -transform.basis.z * speed
	velocity.y = 0
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var hit_target = collision_info.get_collider()
		if hit_target is TankBase:
			hit_target.hit(damage)
		queue_free()