extends Area2D

onready var path_follow = get_parent()

export var speed : int = 0

func _ready():
	$AnimatedSprite.playing = true

func _physics_process(delta):
	path_follow.set_offset(path_follow.get_offset() + speed * delta)

func _on_Enemy_body_entered(body):
	if(body.name == "Player"):
		body.queue_free()
