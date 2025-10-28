extends Node

var problem: Node

func finish() -> void:
	problem.stop()
	queue_free()
