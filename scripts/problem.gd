extends Node

@onready var timer: Timer = $Timer

@export var plant: Node

@export var unlock_time = 10
@export var reload_time = 10
@export_range (0, 20) var reload_time_variation: float = 10

var isActive = false

signal started()
signal stopped()

func _ready() -> void:
	timer.wait_time = unlock_time
	timer.start()

func _process(delta: float) -> void:
	if not isActive:
		return
	
	plant.life -= 1 * delta

func start() -> void:
	started.emit()

func stop() -> void:
	stopped.emit()
	timer.wait_time = reload_time + reload_time_variation * randf()
	timer.start()

func _on_timer_timeout() -> void:
	start()
