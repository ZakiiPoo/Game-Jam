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
	$"Story Box/Ice Background".visible = false
	$"Story Box/Room".visible = true
	sb.visible = true
	$"Story Box".add_child(start_dia)

func first_dialog_done():
	sb_cam.current = false
	sb.visible = false
	#$"Story Box".Dialog.queue_free() 
	player.position = Vector2(2152, -368)
	$Player/Coins.visible = false
	$Player/Gifts.visible = false
	p_cam.current = true


func _on_Santa_1_met_santa():
	sb_cam.current = true
	sb.visible = true
	$"Story Box/Ice Background".visible = true
	$"Story Box/Room".visible = false
	$"Story Box/Particles2D".visible = true
	$"Story Box".add_child(santa_first_scene)

func second_dialog_done():
	sb_cam.current = false
	sb.visible = false
	#$"Story Box".Dialog.queue_free()
	$Player.position = Vector2(179, -442)
	$Player/Coins.visible = true
	$Player/Gifts.visible = true
	p_cam.current = true


func _on_Santa_2_still_no_gifts():
	var santa_no_gifts_scene = Dialogic.start('not all gifts')
	sb_cam.current = true
	sb.visible = true
	$"Story Box/Ice Background".visible = true
	$"Story Box/Room".visible = false
	$"Story Box/Particles2D".visible = true
	$"Story Box".add_child(santa_no_gifts_scene)

func no_gifts_end():
	sb_cam.current = false
	sb.visible = false
	$Player.position = Vector2(128, -440)
	p_cam.current = true
	$"Santa 2".e_pressed = false


func _on_Santa_2_got_gifts():
	get_tree().change_scene("res://Scenes/You Win.tscn")
