extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 0  # pixels/s
var gravity = 0 # pix/s/s
var jump_speed = -0

func _physics_process(delta):
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("ui_down"):
		velocity.y -= jump_speed
	if Input.is_action_just_pressed("ui_up"):
		velocity.y += jump_speed
	velocity.x = Input.get_axis("ui_left", "ui_right") * speed
	#var collision = move_and_collide(velocity * delta)
	velocity = move_and_slide(velocity, Vector2.UP)
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed


func death():
	hide()
	queue_free()
	get_tree().change_scene("res://GameOverScene.tscn")
	

func _on_hitbox_body_entered(body):
	if body == self:
		death()
