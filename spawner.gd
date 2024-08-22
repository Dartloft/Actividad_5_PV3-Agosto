extends Node2D

var preloadEnemy = [preload("res://enemy.tscn")]
@onready var spawn_timer = $SpawnTimer

var nextspawn := 1.0

func _ready():
	randomize()
	spawn_timer.start(nextspawn)
	

func _on_spawn_timer_timeout() -> void:
	var viewrect := get_viewport_rect()
	var xPos = randf_range(viewrect.position.x, viewrect.end.x)
	var enemyPreload = preloadEnemy[randi( ) % preloadEnemy.size()]
	var enemy: Enemy = enemyPreload.instantiate()
	enemy.position = Vector2(xPos, position.y)
	get_tree().current_scene.add_child(enemy)
	spawn_timer.start(nextspawn)
