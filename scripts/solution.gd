extends Node

var problem: Node

func _ready() -> void:
	Data.is_occupied = false

func finish() -> void:
	Data.is_occupied = true
	problem.stop()
	queue_free()
