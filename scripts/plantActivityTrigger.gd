extends Node

@export var linkedProblem : Node
@export var linkedSolution : PackedScene
@export var action_container: Node

func _unhandled_input(event: InputEvent) -> void:
	if linkedProblem.is_active and !Data.is_occupied && event is InputEventMouseButton && event.is_pressed():
		var solution_instance = linkedSolution.instantiate()
		linkedProblem.add_child(solution_instance)
		solution_instance.problem = linkedProblem
