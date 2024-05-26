extends Node2D

@onready var brick = preload("res://scenes/brick.tscn")
@onready var ghost = preload("res://scenes/ghost.tscn")

var row_count = 8
var col_count = 23
var total_bricks = row_count * col_count

func set_bricks():
	var count = 0
	var width = 50
	var height = 20
	for i in range(row_count):
		for j in range(col_count):
			var instance = brick.instantiate()
			instance.get_node("Brick").set_row(i)
			instance.position = Vector2(width*0.5 + width*j, height*0.5 + height*i)
			count += 1
			add_child(instance)
			
func spawn_ghost(position: Vector2):
	total_bricks -= 1
	if total_bricks == 0:
		get_tree().reload_current_scene()
	var instance = ghost.instantiate()
	instance.position = position
	add_child(instance)


func _ready():
	var player_position = get_viewport().get_mouse_position()
	$Player.moveTo(player_position)
	$Ball.brick_hit_signal.connect(spawn_ghost)
	set_bricks()
	
# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventMouseMotion:
		$Player.moveTo(event.position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
