extends StaticBody2D

var row = 0

func set_row(value):
	row = value
	assign_color_based_on_row()

func assign_color_based_on_row():
	var color = Color()
	match row:
		0, 1:
			color = Color8(184, 65, 252)  # Red
		2, 3:
			color = Color8(232, 60, 60)  # Orange
		4, 5:
			color = Color8(117, 218, 107)  # Green
		6, 7:
			color = Color8(252, 152, 56)  # Yellow
		_:
			color = Color(1, 1, 1)  # Default to white if row is out of bounds
	$Sprite.modulate = color

func hit():
	get_parent().queue_free()
