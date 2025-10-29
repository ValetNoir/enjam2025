extends AnimatedSprite2D

@onready var timer: Timer = $Timer
const GAME_ENDED = preload("res://scenes/game_ended.tscn")

func _ready() -> void:
	Data.end_game.connect(end_game)

func end_game() -> void:
	play("die")
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(GAME_ENDED)
