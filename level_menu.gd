extends MarginContainer

var num_grids = 1
var current_grid = 1
var grid_width = 710

@onready var gridbox = $VBoxContainer/HBoxContainer/ClipControl/GridBox

func _ready():
	num_grids = gridbox.get_child_count()
	for grid in gridbox.get_children():
		for box in grid.get_children():
			var num = box.get_index() + 1 + 18 * grid.get_index()
			box.level_num = num
			box.locked = false


func _on_back_button_pressed():
	if current_grid > 1:
		current_grid -= 1
		var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tween.tween_property(gridbox, "position:x", gridbox.position.x + grid_width, 0.5)
#		gridbox.position.x += grid_width


func _on_next_button_pressed():
	if current_grid < num_grids:
		current_grid += 1
		var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tween.tween_property(gridbox, "position:x", gridbox.position.x - grid_width, 0.5)
#		gridbox.position.x -= grid_width
