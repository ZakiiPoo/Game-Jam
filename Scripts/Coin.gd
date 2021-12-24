extends Node2D

func _ready():
	$AnimatedSprite.playing = true

func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		body.coins += 1
		body.update_coins_gifts()
		queue_free()
