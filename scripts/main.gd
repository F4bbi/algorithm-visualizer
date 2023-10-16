extends Control

@export var ss_scene: PackedScene
@onready var button1: Button = %SortingAlgorithms
@onready var button2: Button = %Blind75

func _ready():
	drop_down(button1)
	drop_down(button2)

func _on_sorting_algorithms_pressed():
	drop_down(button1)


func _on_blind_75_pressed():
	drop_down(button2)


func _on_selection_sort_pressed():
	get_tree().change_scene_to_packed(ss_scene)


func drop_down(button: Button):
	var siblings: Array = get_siblings(button)
	if(!siblings.is_empty() and siblings[0].visible):
		hide_siblings(siblings)
	else:
		show_siblings(siblings)


func get_siblings(button: Button) -> Array:
	var res = button.get_parent().get_children()
	res.remove_at(res.find(button))
	return res


func hide_siblings(buttons: Array) -> void:
	for button in buttons:
		button.hide()


func show_siblings(buttons: Array) -> void:
	for button in buttons:
		button.show()
