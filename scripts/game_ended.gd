extends Node

const MAIN_SCENE = preload("uid://d3f1hiiwkltqs")
const TROLL = preload("uid://63x1dtlcbe8d")

func _ready() -> void:
	Input.set_custom_mouse_cursor(null)

func _on_try_again_button_up() -> void:
	Data.reset()
	get_tree().change_scene_to_packed(MAIN_SCENE)

func _on_give_up_button_up() -> void:
	get_tree().change_scene_to_packed(TROLL)
