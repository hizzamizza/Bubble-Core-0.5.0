class_name TankBase
extends CharacterBody3D


@export var move_speed : float
@export var rotate_speed : float

@export var gun : Weapon

@export var health : int = 3

signal on_death


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
	
	transform.origin.y = Util.def_y_height
	move_and_slide()


func hit(damage : int = 0) -> void:
	health -= damage
	health = max(health, 0)
	print(self, ' i have recieved %s damage, %s health left' % [damage, health])
	if health == 0:
		death()


func death() -> void:
	print('dead')
	ScoreCounter.score += 1
	print(ScoreCounter.score)
	on_death.emit()
	queue_free()
