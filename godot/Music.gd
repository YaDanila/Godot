extends Node2D

func _process(delta):
	$AudioStreamPlayer.volume_db = Global.volume


func _ready():
	pass
