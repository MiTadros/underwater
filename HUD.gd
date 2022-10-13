extends CanvasLayer

signal start_game

func show_message(text):
	$VBoxContainer/StartMessage.show = text
	$VBoxContainer/StartButton.show()
	
func _on_StartButton_pressed():
	$VBoxContainer/StartButton.hide()
	$VBoxContainer/StartMessage.hide()
	emit_signal("start_game")
