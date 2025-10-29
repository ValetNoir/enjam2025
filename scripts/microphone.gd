extends Node

@export var text : Label
@export var countText : Label
var characterCountMax = 150

signal textCompleted
signal textProgressed

func _ready() -> void:
	countText.text = "0 / " + str(characterCountMax)
func _unhandled_input(event: InputEvent) -> void:
		if event is InputEventKey and event.is_pressed():
			$SFX_Play.play()
			var key_event := event as InputEventKey
			if !(key_event.keycode & KEY_SPECIAL):
				var letter := String.chr(key_event.unicode)
				
				text.text += letter
				countText.text = str(text.text.length()) + " / " + str(characterCountMax)
				
				if text.text.length() >= characterCountMax:
					textCompleted.emit()
				else:
					textProgressed.emit()
				
				
				
