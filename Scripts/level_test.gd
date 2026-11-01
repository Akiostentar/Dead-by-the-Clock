extends Node2D

@onready var player: Player = $Map/Player
@onready var bullet_manager: Node2D = $BulletManager


func _ready() -> void:
	player.player_shot.connect(bullet_manager.handle_bullet_spawn)
