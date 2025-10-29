extends Node

var problem: Node

func _ready() -> void:
	Data.is_occupied = true

func finish() -> void:
	Data.is_occupied = false
	problem.stop()
	queue_free()
