class_name Enemy extends Area2D

@export var SPEED: float = 150

func _physics_process(delta):
	global_position.y += +SPEED * delta
	

func die():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.damage(1)
		$colision.playing = true
		


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


