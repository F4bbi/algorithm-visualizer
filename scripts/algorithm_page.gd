extends Control

@export var pointer_scene: PackedScene
@onready var array = %Array

var is_paused: bool = false
var timer_amount: float = 1
var base_value: float = 1

func _ready():
	load_code()


func load_code():
	var file = FileAccess.open("res://assets/selection_sort.txt", FileAccess.READ)
	var content = file.get_as_text()
	%CodeEditor.text = file.get_as_text()


func _on_start_pressed():
	array.clear()
	var numbers = %LineEdit.text.split(" ")
	array.create(numbers)
	await get_tree().create_timer(timer_amount, false).timeout

	var reminder = pointer_scene.instantiate()
	add_child(reminder)
	reminder.point(array.get_element_at(0), 0)
	var iterator = pointer_scene.instantiate()
	add_child(iterator)
	iterator.point(array.get_element_at(0), 0)
	
	var minimum = pointer_scene.instantiate()
	add_child(minimum)
	minimum.index = "m"
	minimum.point(array.get_element_at(0), 0)
	await get_tree().create_timer(timer_amount, false).timeout
		
	for i in range(0, array.size() - 1):
		var element = array.get_element_at(i)
		reminder.point(element, i)
		var m = i
		minimum.point(element, i)	
		
		for j in range(i + 1, array.size()):
			var curr = array.get_element_at(j)
			iterator.point(curr, j)
			if (array.get_element_at(j).value <= array.get_element_at(m).value):
				minimum.point(curr, j)
				m = j
			await get_tree().create_timer(timer_amount, false).timeout
		if(m != i):
			array.highlight(m)
			array.highlight(i)
			await get_tree().create_timer(timer_amount, false).timeout
			array.swap(m, i)
			await get_tree().create_timer(timer_amount, false).timeout
			array.unhighlight(m)
			array.unhighlight(i)
		else:
			array.highlight(m)
			await get_tree().create_timer(timer_amount, false).timeout
			array.unhighlight(m)
	
	await get_tree().create_timer(timer_amount, false).timeout
	reminder.queue_free()
	iterator.queue_free()
	minimum.queue_free()


func _on_pause_pressed():
	OS.alert("TODO")
	#get_tree().paused = !is_paused
	#is_paused = !is_paused
	pass


func _on_stop_pressed():
	OS.alert("TODO")
	pass


func _on_speed_slider_value_changed(value):
	if %SpeedSlider.value < 0:
		%Multiplier.text = "x" + str(base_value * ((%SpeedSlider.max_value + %SpeedSlider.value) / (%SpeedSlider.max_value)))
	else:
		%Multiplier.text = "x" + str(%SpeedSlider.value + 1)
		
	if %SpeedSlider.value >= %SpeedSlider.max_value:
		%Multiplier.text = "∞"
	
	if %SpeedSlider.value > 0:
		timer_amount = base_value - (%SpeedSlider.value / %SpeedSlider.max_value)
	else:
		timer_amount = base_value * (abs(%SpeedSlider.value) + 1)


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/main.tscn")
