extends Node2D

var direction = Vector2.ZERO
	
var elapsed_time = 0.0

func _ready():
	direction = Vector2(0,300)

func _process(delta):
	elapsed_time += delta
	$Ghost/Sprite.modulate = Color(
		1,
		1,
		1,
		sin(elapsed_time * 5)
	)
	
func _physics_process(delta):
	var collision = $Ghost.move_and_collide(direction*delta)
	if collision:
		var collider = collision.get_collider()
		if (collider.get_name() == "Player"):
			get_tree().reload_current_scene()
		if (collider.get_name() == "Ball"):
			queue_free()


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
