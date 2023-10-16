extends Node

const letters: Array = ['i', 'j', 'k', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
const LETTER_COUNT: int = 26
var current_index: int = 0

func get_letter():
	if (current_index >= LETTER_COUNT):
		OS.alert("Lettere esaurite!")
	else:
		var curr = letters[current_index];
		current_index += 1
		return curr
