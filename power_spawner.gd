extends Node2D

const powerup = preload("res://powerup.tscn")
@onready var time_start = false


func _ready() -> void:
	pass # Replace with function body.

func _process(delta):
	if Engine.is_editor_hint():
		return
	if time_start == false:
		$powerTimer.wait_time == randf_range(0.3, 0.7)
		$powerTimer.start()
		time_start = true
		

func _on_power_timer_timeout() -> void:
	randomize()
	var aPow = powerup.instantiate()
	var aPos = Vector2()
	aPos.x = randf_range(aPow.spriteSize - 2 , get_viewport().get_visible_rect().size.x - aPow.spriteSize + 2)
	aPos.y = 0 - aPow.spriteSize - 400
	aPow.position = aPos
	
	$Container.add_child(aPow)
	$powerTimer.wait_time = randf_range(1.0, 1.0)
	$powerTimer.start()
