extends Node

var problem: Node

func _ready() -> void:
	Data.is_occupied = true
	Data.end_game.connect(queue_free)

func finish() -> void:
	Data.is_occupied = false
	problem.stop()
	queue_free()
