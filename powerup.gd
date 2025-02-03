class_name Powerup extends Area2D

@export var velocity = Vector2(0,0)
@export var spriteSize = int()


func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	translate(velocity * delta)
	if get_position().y - spriteSize >= get_viewport_rect().size.y:
		queue_free()

func die():
	queue_free()

func _on_body_entered(body: Node2D):
	if body is Player:
		body.damage(1)
		$colision.playing = true


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
