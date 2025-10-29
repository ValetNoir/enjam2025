extends Node

@export var linkedProblem : Node
@export var linkedSolution : PackedScene

@onready var sprite_2d: Sprite2D = $Sprite2D

var mouse_inside_area = false

func _unhandled_input(event: InputEvent) -> void:
	if not linkedProblem : return # JUST FOR DEBUG, SHOULDN'T RELEASE
	if mouse_inside_area and linkedProblem.is_active and not Data.is_occupied and event is InputEventMouseButton and event.is_pressed():
		var solution_instance = linkedSolution.instantiate()
		get_tree().get_root().add_child(solution_instance)
		solution_instance.problem = linkedProblem

func _on_mouse_entered() -> void:
	mouse_inside_area = true
	if not linkedProblem : return # JUST FOR DEBUG, SHOULDN'T RELEASE
	if linkedProblem.is_active and !Data.is_occupied:
		sprite_2d.show()

func _on_mouse_exited() -> void:
	mouse_inside_area = false
	if not linkedProblem : return # JUST FOR DEBUG, SHOULDN'T RELEASE
	sprite_2d.hide()
