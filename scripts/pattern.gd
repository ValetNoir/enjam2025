extends Path2D

@onready var pointer: PathFollow2D = $Pointer
@onready var line_2d: Line2D = $Line2D
@onready var colored_pattern: Line2D = $ColoredPattern

var mouse_inside_area = false
var current_point_index = 0
var points

var has_finished = false
signal finished()

func _ready() -> void:
	curve.bake_interval = 50
	points = curve.get_baked_points()
	line_2d.points = points
	colored_pattern.add_point(points[0])

func _process(_delta: float) -> void:
	if pointer.progress > curve.get_baked_length() - 25 or current_point_index + 1 == points.size():
		if not has_finished:
			colored_pattern.add_point(points[points.size() - 1])
			finished.emit()
			has_finished = true
		return
	
	if mouse_inside_area and Input.is_action_pressed("click"):
		var curve_part = Curve2D.new()
		curve_part.add_point(points[current_point_index])
		curve_part.add_point(points[current_point_index + 1])
		if(current_point_index + 2 < points.size()):
			curve_part.add_point(points[current_point_index + 2])
		
		var distance_along_line_part = curve_part.get_closest_offset(get_global_mouse_position())
		var distance_behing_line_part = curve.get_closest_offset(points[current_point_index])
		var distance_along_line = distance_behing_line_part + distance_along_line_part
		
		if distance_along_line > pointer.progress and distance_along_line - pointer.progress < 100:
			pointer.progress = distance_along_line
	
	if curve.get_closest_offset(points[current_point_index + 1]) <= pointer.progress:
		current_point_index += 1
		colored_pattern.add_point(points[current_point_index])

func _on_area_2d_mouse_entered() -> void:
	mouse_inside_area = true

func _on_area_2d_mouse_exited() -> void:
	mouse_inside_area = false
