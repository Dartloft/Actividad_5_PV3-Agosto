class_name Enemy extends Area2D

@export var SPEED: float = 150


func _physics_process(delta):
	if Engine.is_editor_hint():
		return
	global_position.y += +SPEED * delta
	

func die():

	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		var camera = get_tree().get_first_node_in_group("camera")
		camera.shake_camera(10,0.5)
		body.damage(1)
		$colision.playing = true
		

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


