extends Node3D


@export var dummy_tank : TankBase
@export var base_mesh : MeshInstance3D


signal new_target_needed

func _ready() -> void:
	Locator.floor_mesh = base_mesh
	make_target()


func make_target() -> void:
	var new_target = dummy_tank.duplicate()
	new_target.transform.origin = Util.random_point_on_floor()
	add_child(new_target)
	new_target.on_death.connect(make_target)
	print(new_target.transform.origin)