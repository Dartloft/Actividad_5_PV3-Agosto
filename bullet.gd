extends Area2D

@export var SPEED = 300
@onready var explosion_prefab = preload("res://explode.tscn")

func _physics_process(delta):
	if Engine.is_editor_hint():
		return
	global_position.y += -SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area is Enemy:
	
		var explosion = explosion_prefab.instantiate()
		explosion.position = position
		get_parent().add_child(explosion)
		queue_free()
		area.queue_free()
		
		var camera = get_tree().get_first_node_in_group("camera")
		camera.shake_camera(5,0.5)
		
		Signals.emit_signal("on_score_increment",10 )
		
		$explode.playing = true
	
	if area is Powerup:
		area.die()
		Signals.emit_signal("on_score_increment",5 )
		queue_free()
		
		$explode.playing = true	
		
		
