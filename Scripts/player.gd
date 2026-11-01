extends CharacterBody2D

@export var speed: float = 300.0

@onready var bullet_spawn: Marker2D = $"Bullet spawn"
@onready var gun_direction: Marker2D = $"Gun Direction"

const BULLET = preload("uid://cg0gvc8pkicg3")

signal player_shot(bullet, spawn_position, direction)

func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())


func _physics_process(_delta: float) -> void:
	get_player_input()
	move_and_slide()

func get_player_input():
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	var bullet_instance = BULLET.instantiate()
	var direction = (gun_direction.global_position - bullet_spawn.global_position).normalized()
	emit_signal("player_shot", bullet_instance, bullet_spawn.global_position, direction)
