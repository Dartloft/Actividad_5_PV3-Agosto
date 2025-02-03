extends Control

var is_paused:bool = true:
	set = set_paused
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("pause"):
		is_paused = ! is_paused
		
func set_paused(value:bool):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	
func _on_resume_pressed() -> void:
	is_paused = false


func _on_quit_pressed() -> void:
	get_tree().quit()
