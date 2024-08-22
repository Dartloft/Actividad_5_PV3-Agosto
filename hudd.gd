extends Control

var icon := preload("res://hud.tscn") 
@onready var lifeContainer := $lifeContainer
@onready var scoreLabel := $Score 
var score:int = 0

func _ready():
	clearlives()
	Signals.connect("on_player_life_changed",_on_player_life_changed)
	Signals.connect("on_score_increment",_on_score_increment)
	
func clearlives():
	for child in lifeContainer.get_children():
		lifeContainer.remove_child(child)
		child.queue_free()
			
func setlives(lives : int):
	clearlives()
	for i in range(lives):
		lifeContainer.add_child(icon.instantiate())
		
func _on_player_life_changed(life: int):
	setlives(life)		

func _on_score_increment(amount):
	score += amount	
	scoreLabel.text = str(score)
				
