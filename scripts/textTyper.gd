extends Node

@export var wordList : Array[String]
var index = 0
var selectedWord: String

@export var backgroundText : Label
@export var typedText : Label

signal sentenceProgressed
signal sentenceCompleted

func _ready() -> void:
	pickWord()
	
	
func pickWord() -> void:
	var temp = randi_range(0,wordList.size()-1)
	selectedWord = wordList[temp]
	backgroundText.text = selectedWord
	
func _unhandled_input(event: InputEvent) -> void:
	if selectedWord != "":
		if event is InputEventKey and event.is_pressed():
			var key_event := event as InputEventKey
			if !(key_event.keycode & KEY_SPECIAL):
				var letter := String.chr(key_event.unicode)
				
				if letter.to_lower() == selectedWord[index].to_lower():
					typedText.text = typedText.text.left(typedText.text.length() - 1)
					typedText.text += (letter + "|")
					index += 1
					if index >= selectedWord.length():
						sentenceEnded()
					else:
						sentenceProgressed.emit()
						print(selectedWord[index])
				
				
			
func sentenceEnded() -> void:
	selectedWord = ""
	typedText.text = ""
	backgroundText.text = ""
	index = 0
	sentenceCompleted.emit()
