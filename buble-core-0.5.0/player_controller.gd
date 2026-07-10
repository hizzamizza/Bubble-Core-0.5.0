extends CollisionShape3D


@export var tank : CharacterBody3D
@export var speed : float


func _physics_process(delta: float) -> void:
	handle_inputs(delta)


func handle_inputs(delta) -> void:
	var x_total = Input.get_action_strength('right') - Input.get_action_strength('left')
	var z_total = Input.get_action_strength('down') - Input.get_action_strength('up')

	var net_vector = Vector3(x_total, 0, z_total)

	tank.position += net_vector * delta * speed
