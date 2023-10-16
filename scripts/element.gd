extends PanelContainer
class_name Element

var value: int = 0:
	set (new_value):
		%Value.set_text(str(new_value))
		value = new_value
	get:
		return value

# Returns the position as the center of the top side
func get_pos():
	return Vector2(get_global_position().x + (size.x / 2), get_global_position().y)

# Highlight the borders in red and bring the element into focus
func highlight():
	z_index = 1
	%Border.border_color = Color.RED

# Highlight the borders in black and bring the element back
func unhighlight():
	z_index = 0
	%Border.border_color = Color.BLACK
