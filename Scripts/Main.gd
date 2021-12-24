extends Control

var result

func _on_Button_pressed():
	result = get_tree().change_scene("res://Scenes/World.tscn")
