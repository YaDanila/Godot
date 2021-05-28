extends Control

func _ready():
	pass # Replace with function body.
	
func _process(delta):
	$AudioStreamPlayer.volume_db = Global.sounds
	

func _on_Restart_pressed():
	get_tree().change_scene("res://Level1.tscn")


func _on_BackMenu_pressed():
	get_tree().change_scene("res://Menu.tscn")
