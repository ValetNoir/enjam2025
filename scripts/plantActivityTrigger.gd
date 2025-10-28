extends Node

@export var linkedProblem : Node

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		# TODO : Vérifier que la LED est allumée quand le système sera implémenté
		# TODO : Trigger la bonne activité
		pass
