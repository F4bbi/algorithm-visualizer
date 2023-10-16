extends Area2D
class_name Pointer

var index: String = "":
	set(new_index):
		index = new_index
	get:
		return index

var value: int = 0

func _ready():
	%Label.set_h_grow_direction(Control.GROW_DIRECTION_BEGIN)
	index = Index.get_letter()


func point(element: Element, value):
	position = element.get_pos()
	self.value = value
	%Label.set_text(index + " = " + str(value))	


func _on_area_entered(area):
	if(get_instance_id() > area.get_instance_id()):
		%Label.position -= Vector2(0, %Label.size.y)


func _on_area_exited(area):
	if(get_instance_id() > area.get_instance_id()):
		%Label.position += Vector2(0, %Label.size.y)
