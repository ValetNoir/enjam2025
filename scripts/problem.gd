extends Node

@onready var timer: Timer = $Timer

@export var unlock_time = 10
@export var reload_time = 10
@export_range (0, 20) var reload_time_variation: float = 10
@export var health_boost = 50
@export var damage_per_second = 1

var is_active = false

signal started()
signal stopped()

func _ready() -> void:
	timer.wait_time = unlock_time
	timer.start()

func _process(delta: float) -> void:
	if not is_active:
		return
	
	Data.plant_health -= damage_per_second * delta

func start() -> void:
	started.emit()
	is_active = true

func stop() -> void:
	stopped.emit()
	timer.wait_time = reload_time + reload_time_variation * randf()
	timer.start()
	is_active = false
	Data.plant_health = min(Data.plant_health + health_boost, 100)
	$SFX_Resolve.play()

func _on_timer_timeout() -> void:
	start()
