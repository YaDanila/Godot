extends Node2D


func _process(delta):
	$Stats/CanvasLayer/ForCoins.text = str($Player.coins)
	$Stats/CanvasLayer/ForHP.text = str($Player.hp)
	if Input.is_action_just_pressed("ui_cancel") && $Settings.visible == false:
		$Settings.visible = true
		$Settings/CanvasLayer/Settings.visible = true
		$Settings/CanvasLayer/Music.visible = true
		$Settings/CanvasLayer/Sounds.visible = true
		$Settings/CanvasLayer/BackMenu.visible = true
		$Settings/CanvasLayer/Sprite.visible = true
		$Settings/CanvasLayer/plus.visible = true
		$Settings/CanvasLayer/minus.visible = true
		$Settings/CanvasLayer/plus2.visible = true
		$Settings/CanvasLayer/minus2.visible = true
	elif Input.is_action_just_pressed("ui_cancel") && $Settings.visible == true:
		$Settings.visible = false
		$Settings/CanvasLayer/Settings.visible = false
		$Settings/CanvasLayer/Music.visible = false
		$Settings/CanvasLayer/Sounds.visible = false
		$Settings/CanvasLayer/BackMenu.visible = false
		$Settings/CanvasLayer/Sprite.visible = false
		$Settings/CanvasLayer/plus.visible = false
		$Settings/CanvasLayer/minus.visible = false
		$Settings/CanvasLayer/plus2.visible = false
		$Settings/CanvasLayer/minus2.visible = false
		
		
		
