extends Area2D

@export var SPEED = 300

func _physics_process(delta):
	global_position.y += -SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area is Enemy:
		area.die()
		Signals.emit_signal("on_score_increment",1 )
		queue_free()
		$explode.playing = true
