extends Camera2D

var _range = RandomNumberGenerator.new()
var duration = 0
var force

func _ready() -> void:
	add_to_group("camera")

func _process(delta: float) -> void:
	if duration > 0:
		var forceX = _range.randf_range(-1,1) * force
		var forceY = _range.randf_range(-1,1) * force
		
		offset = Vector2(forceX, forceY)
		duration -= delta

func shake_camera(shakeForce, shakeDuration):
	duration = shakeDuration
	force = shakeForce
