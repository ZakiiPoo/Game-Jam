extends Node2D

var player_in = false

func _process(_delta):
	if(Input.is_action_pressed("E") && player_in):
		pass

func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		player_in = true
