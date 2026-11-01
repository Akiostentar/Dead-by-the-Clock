extends CharacterBody2D
class_name enemy

@export var health: float = 10
 
func take_damage(damage):
	print("damage taken: ", damage)
	health -= damage
	print("health left: ", health)
	
	if health <= 0:
		queue_free()
		print("man im dead")
