extends Node

var volume: float = 0.5
var resolution: Vector2 = Vector2(1920, 1080)
var fullscreen: bool = false

func set_volume(value: float) -> void:
	volume = value

func get_volume() -> float:
	return volume

func set_resolution(value: Vector2) -> void:
	resolution = value

func get_resolution() -> Vector2:
	return resolution

func set_fullscreen(value: bool) -> void:
	fullscreen = value
	
func get_fullscreen() -> bool:
	return fullscreen
