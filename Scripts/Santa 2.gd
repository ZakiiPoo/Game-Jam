extends Node2D

signal still_no_gifts
signal got_gifts

var player
var player_in: bool = false
export(bool) var e_pressed = false

func _ready() -> void:
	$Sprite.frame = 0

func _process(_delta):
	if(Input.is_action_pressed("E") && player_in && !e_pressed):
		e_pressed = true
		if(player.gifts >= 20):
			emit_signal("got_gifts")
		else:
			emit_signal("still_no_gifts")

func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		$AnimationPlayer.play("icon_move")
		player_in = true
		player = body


func _on_Area2D_body_exited(body):
	if(body.name == "Player"):
		$AnimationPlayer.play_backwards("icon_move")
		player_in = false
