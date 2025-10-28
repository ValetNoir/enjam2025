extends Node

@export var linkedProblem : Node
@export var linkedSolution : PackedScene

@onready var sprite_2d: Sprite2D = $Sprite2D

func _unhandled_input(event: InputEvent) -> void:
	if linkedProblem.is_active and !Data.is_occupied && event is InputEventMouseButton && event.is_pressed():
		var solution_instance = linkedSolution.instantiate()
		get_tree().get_root().add_child(solution_instance)
		solution_instance.problem = linkedProblem

func _on_mouse_entered() -> void:
	sprite_2d.show()

func _on_mouse_exited() -> void:
	sprite_2d.hide()
