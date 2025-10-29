extends Node

var is_pump_filled = false
var index = 0
@export var pumps: Array[Node]
@export var pumpArea: Area2D

signal finished

func _ready() -> void:
	pass
		

func _on_pump_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if !is_pump_filled and event is InputEventMouseButton and event.is_pressed():
		pumps[index].visible = false
		index += 1;
		if index >= pumps.size():
			finished.emit()
		
