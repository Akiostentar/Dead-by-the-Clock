extends CharacterBody2D
class_name Player

@export var speed: float = 125
@export var max_reserve_ammo: int = 45
@export var mag_size: int = 12

@onready var bullet_spawn: Marker2D = $"Bullet spawn"
@onready var gun_direction: Marker2D = $"Gun Direction"
@onready var attack_cooldown: Timer = $"Attack Cooldown"
@onready var reload_time: Timer = $Reload
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const BULLET = preload("uid://cg0gvc8pkicg3")

#var current_ammo: int
#var reserve_ammo: int
#var can_fire: bool
#var is_reloading: bool

signal player_shot(bullet, spawn_position, direction)


#func _ready() -> void:
	#current_ammo = mag_size
	#reserve_ammo = max_reserve_ammo


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
		if attack_cooldown.is_stopped():
			attack_cooldown.start()
			animation_player.play("Gun Recoil")
			shoot()

func shoot():
	#if not can_fire or is_reloading:
		#return
	#if current_ammo <= 0:
		#reload()
		#return
	#current_ammo -= 1
	#can_fire = false
	#
	attack_cooldown.start()
	
	var bullet_instance = BULLET.instantiate()
	var direction = (gun_direction.global_position - bullet_spawn.global_position).normalized()
	emit_signal("player_shot", bullet_instance, bullet_spawn.global_position, direction)
	
	await attack_cooldown.timeout
	#can_fire = true


#func reload():
	#if is_reloading or current_ammo == mag_size or reserve_ammo:
		#return
	#is_reloading = true
	#reload_time.start()

#func _on_reload_timeout() -> void:
	#var ammo_needed = mag_size - current_ammo
	#var ammo_to_load = min(ammo_needed, reserve_ammo)
	#
	#current_ammo += ammo_to_load
	#reserve_ammo -= ammo_to_load
	#is_reloading = false
	
