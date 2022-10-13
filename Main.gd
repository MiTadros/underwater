extends Node2D



func _on_HUD_start_game():
	$PlayerDemo.gravity = -15
	$PlayerDemo.speed = 100
	$PlayerDemo.jump_speed = -175


func _on_endbox_body_entered(body):
	if body == $PlayerDemo:
		get_tree().change_scene("res://NextLevel.tscn")
	
