extends SpotLight3D

@export var min_energy: float = 0.2
@export var max_energy: float = 5.0
@export var flicker_chance: float = 0.1

func _process(_delta):
	if randf() < flicker_chance:
		light_energy = randf_range(min_energy, max_energy)
	else:
		light_energy = max_energy
