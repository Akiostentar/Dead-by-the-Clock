extends Area2D

@export var speed: float = 25
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var direction = Vector2.ZERO


func _process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		global_position += velocity


func set_direction(direction: Vector2):
	self.direction = direction
	rotation = direction.angle()
