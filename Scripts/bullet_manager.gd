extends Node2D

func handle_bullet_spawn(bullet: Bullet, spawn_position, direction):
	add_child(bullet)
	bullet.global_position = spawn_position
	bullet.set_direction(direction)
