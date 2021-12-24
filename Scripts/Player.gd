extends KinematicBody2D

var velocity = Vector2.ZERO
var speed : int = 5000
export(int) var coins  = 0
export(int) var gifts  = 0

onready var animated_sprite = $AnimatedSprite
onready var coin_label = $Coins/Label
onready var gift_label = $Gifts/Label

func _physics_process(delta):
	get_velocity()
	speed_boost()
	velocity = velocity * delta * speed
	velocity = move_and_slide(velocity)

func get_velocity():
	velocity = Vector2.ZERO
	velocity.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	velocity.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	velocity = velocity.normalized()
	animate(velocity)

func speed_boost():
	if(Input.is_action_pressed("sprint")):
		speed += 2000
		animated_sprite.speed_scale = 3
	else:
		speed = 5000
		animated_sprite.speed_scale = 1

func animate(vel):
	if(vel.x == 1):
		animated_sprite.flip_h = false
		animated_sprite.animation = "walk_right"
	if(vel.x == -1):
		animated_sprite.flip_h = true
		animated_sprite.animation = "walk_right"
	if(vel.y == 1):
		animated_sprite.animation = "walk_down"
	if(vel.y == -1):
		animated_sprite.animation = "walk_up"
	if(vel.x == 0 && vel.y == 0):
		animated_sprite.animation = "idle_down"

func update_coins_gifts():
	coin_label.text = String(coins)
	gift_label.text = String(gifts) + "/20"
