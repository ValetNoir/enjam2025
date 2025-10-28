extends Node

@export var linkedProblem : Node
@export var linkedSolution : PackedScene

func _unhandled_input(event: InputEvent) -> void:
	if linkedProblem.is_active and !Data.is_occupied && event is InputEventMouseButton && event.is_pressed():
		var solution_instance = linkedSolution.instantiate()
		get_tree().get_root().add_child(solution_instance)
		solution_instance.problem = linkedProblem
