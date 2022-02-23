extends Node2D

signal met_santa

func _ready():
	$Sprite.frame = 1


func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		$Sprite.frame = 0
		emit_signal("met_santa")
