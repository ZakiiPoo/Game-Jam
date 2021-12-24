extends Node2D

var start_dia = Dialogic.start('start')
var santa_first_scene = Dialogic.start('santa first')

onready var sb_cam = $"Story Box/Camera2D"
onready var sb = $"Story Box"
onready var player = $Player
onready var p_cam = $Player/Camera2D

func _ready():
	game_start()
	$Player.position = Vector2(128, -440)


func game_start():
	sb_cam.current = true
	sb.visible = true
	$"Story Box".add_child(start_dia)

func first_dialog_done():
	sb_cam.current = false
	$"Story Box/Camera2D".current = true
	player.position = Vector2(2152, -368)
	$Player/Coins.visible = false
	$Player/Gifts.visible = false
	p_cam.current = true
