extends Control


func _on_BackMenu_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_plus_pressed():
	Global.volume += 2


func _on_minus_pressed():
	Global.volume -= 2


func _on_plus2_pressed():
	Global.sounds += 2


func _on_minus2_pressed():
	Global.sounds -= 2


