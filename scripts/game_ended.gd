extends Node

var MAIN_SCENE = load("res://scenes/mainScene.tscn")
var TROLL = load("res://scenes/troll.tscn")

func _ready() -> void:
	Input.set_custom_mouse_cursor(null)

func _on_try_again_button_up() -> void:
	Data.reset()
	get_tree().change_scene_to_packed(MAIN_SCENE)

func _on_give_up_button_up() -> void:
	get_tree().change_scene_to_packed(TROLL)
