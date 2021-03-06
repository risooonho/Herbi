extends RigidBody2D

onready var player_dir = get_node("/root/world/player").dir_right

func _ready():
	add_to_group("apple")
	if player_dir:
		set_angular_velocity(40)
		set_linear_velocity(Vector2(320,0))
	else:
		set_angular_velocity(-40)
		set_linear_velocity(Vector2(-320,0))

func _on_Area2D_body_enter( body ):
	if body.is_in_group("enemies"):
		queue_free()
		body.kill_monster()

func _on_Timeout_finished():
	queue_free()