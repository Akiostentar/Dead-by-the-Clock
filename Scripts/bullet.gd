extends Area2D
class_name Bullet

@export var speed: float = 25
@export var damage: float = 5
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var kill_timer: Timer = $KillTimer

var direction = Vector2.ZERO


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	kill_timer.start()


func _process(_delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		global_position += velocity


func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()


func _on_kill_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(damage)
	
