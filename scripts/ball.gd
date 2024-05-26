extends Node2D

var direction = Vector2.ZERO

signal brick_hit_signal

func _ready():
	direction = Vector2(500,500)
	
func _physics_process(delta):
	var collision = $Ball.move_and_collide(direction*delta)
	if collision:
		var reflect = collision.get_remainder().bounce(collision.get_normal())
		direction = direction.bounce(collision.get_normal())
		$Ball.move_and_collide(reflect)
		var collider = collision.get_collider()
		if (collider.get_name() == "Brick"):
			collider.hit()
			emit_signal("brick_hit_signal", collider.get_parent().position)


func _on_visible_on_screen_enabler_2d_screen_exited():
	get_tree().reload_current_scene()
