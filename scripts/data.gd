extends Node

var plant_health = 100
var is_occupied = false

var plant_died = false
var problems_sovled = 0

signal end_game()

func reset():
	plant_health = 100
	is_occupied = false
	plant_died = false

func _process(_delta: float) -> void:
	if plant_health <= 0 and not plant_died:
		plant_died = true
		end_game.emit()
