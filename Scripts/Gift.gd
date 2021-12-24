extends Node2D

#oop
onready var anim_player = $AnimationPlayer
onready var icon = $TextureRect 

var rng = RandomNumberGenerator.new()
var playerIn = false
var player

func _ready():
	icon.visible = false
	rng.randomize()
	var my_random_number = int(rng.randf_range(0, 3))
	$AnimatedSprite.frame = my_random_number

func _process(_delta):
	if(Input.is_action_pressed("E") && playerIn):
		player.gifts += 1
		player.update_coins_gifts()
		queue_free()

func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		icon.visible = true
		player = body
		anim_player.play("icon_movement")
		playerIn = true


func _on_Area2D_body_exited(body):
	if(body.name == "Player"):
		anim_player.play_backwards("icon_movement")
		playerIn = false
