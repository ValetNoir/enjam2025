extends Node

var plant_health = 100
var is_occupied = false

var plant_died = false
var problems_sovled = 0

signal end_game()

func _process(_delta: float) -> void:
	if plant_health <= 0:
		plant_died = true
		end_game.emit()
