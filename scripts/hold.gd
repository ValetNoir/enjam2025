extends Area2D

@onready var timer: Timer = $Timer

var mouse_inside_area = false

signal finished()

func _ready() -> void:
	timer.start()
	timer.paused = true

func _process(_delta: float) -> void:
	if mouse_inside_area and Input.is_action_pressed("click"):
		timer.paused = false
	else:
		timer.paused = true

func _on_area_2d_mouse_entered() -> void:
	mouse_inside_area = true

func _on_area_2d_mouse_exited() -> void:
	mouse_inside_area = false

func _on_timer_timeout() -> void:
	finished.emit()
