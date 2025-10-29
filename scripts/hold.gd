extends Area2D

@export var cursor_sprite: Resource

@onready var timer: Timer = $Timer
@onready var progress_bar: ProgressBar = $ProgressBar

var mouse_inside_area = false

signal finished()

func _ready() -> void:
	timer.start()
	timer.paused = true
	Input.set_custom_mouse_cursor(cursor_sprite)
	progress_bar.max_value = timer.wait_time
	progress_bar.hide()

func _process(_delta: float) -> void:
	progress_bar.global_position = get_global_mouse_position() - Vector2(0, 65)
	progress_bar.value = timer.wait_time - timer.time_left
	if mouse_inside_area and Input.is_action_pressed("click"):
		timer.paused = false
	else:
		timer.paused = true

func _on_area_2d_mouse_entered() -> void:
	progress_bar.show()
	mouse_inside_area = true

func _on_area_2d_mouse_exited() -> void:
	progress_bar.hide()
	mouse_inside_area = false

func _on_timer_timeout() -> void:
	Input.set_custom_mouse_cursor(null)
	finished.emit()
