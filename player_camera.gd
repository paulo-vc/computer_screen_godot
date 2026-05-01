extends Camera3D

@export var fov_zoom = 35.0
@export var fov_normal = 55.0 
@export var zoom_speed = 0.2

func _process(_delta: float) -> void:
	if Input.is_action_pressed("zoom"):
		_apply_fov(fov_zoom)
	else:
		_apply_fov(fov_normal)

func _apply_fov(target: float) -> void:
	# Interpolação suave para não bugar a visão
	fov = lerp(fov, target, 0.1)
