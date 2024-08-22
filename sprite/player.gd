class_name Player extends CharacterBody2D

@export var life : int = 4
@export var SPEED: float = 200
var VELOCITY = Vector2()

var bulletPath = preload("res://bullet.tscn")
var screen_size


	
func _ready():
	Signals.emit_signal("on_player_life_changed",life)
	screen_size = get_viewport_rect().size
	

func _process(delta):

	if(!Input.is_anything_pressed()):
		velocity.x = 0
		velocity.y = 0
	if (Input.is_action_pressed("move_up")):
		velocity.y = -SPEED
	if (Input.is_action_pressed("move_bottom")):
		velocity.y = SPEED
	if (Input.is_action_pressed("move_left")):
		velocity.x = -SPEED
	if (Input.is_action_pressed("move_right")):
		velocity.x = SPEED	
		
	VELOCITY = VELOCITY.normalized()
	
	global_position += SPEED * VELOCITY * delta
	move_and_slide()
	
	position.x = clamp(position.x, 20, screen_size.x)
	position.y = clamp(position.y, 100, screen_size.y)

	if Input.is_action_just_pressed("fire"):
		#cargo la funcion shoot()
		$shot.playing = true
		shoot()
	
func shoot():
	#instancio la variable bullet
	var bullet = bulletPath.instantiate()
	 #toma la posicion del hitbox
	bullet.position = $Muzzle.global_position
	get_tree().current_scene.add_child(bullet)
	
func damage(amount :int):
	modulate = Color.WHITE_SMOKE
	life -= amount
	Signals.emit_signal("on_player_life_changed",life)
	$Timer.start(0.1)
	if life <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://control.tscn")


func _on_timer_timeout() -> void:
	modulate = Color(0.784, 0.172, 0.302)
