extends Node

@export var bonnet_sprite_scene : PackedScene

signal finished()

func create_bonnet():
	var instance = bonnet_sprite_scene.instantiate()
	get_tree().get_root().add_child(instance)
	finished.emit()
