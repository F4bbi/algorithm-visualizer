extends HBoxContainer
class_name MyArray

var elements = []
@export var element_scene: PackedScene


func create(array: Array):
	for element in array:
		add_element(element.to_int())

# Remove all elements from the array
func clear():
	elements.clear()
	for child in get_children():
		remove_child(child)
		child.queue_free()


func add_element(num):
	var new_element = element_scene.instantiate()
	new_element.value = num
	elements.append(new_element)
	add_child(new_element)


func remove_element(element_to_remove):
	if elements.has(element_to_remove):
		elements.erase(element_to_remove)


func get_elements():
	return elements


func get_element_at(name):
	if name < elements.size():
		return elements[name]
	return null


func size():
	return elements.size()

# Swap two elements in the array
func swap(i, j):
	var temp = elements[i].value
	elements[i].value = elements[j].value
	elements[j].value = temp

# Highlight the element at the specified name
func highlight(i):
	elements[i].highlight()

# Remove the highlight from the element at the specified name
func unhighlight(i):
	elements[i].unhighlight()
