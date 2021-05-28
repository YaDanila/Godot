extends Node2D

func _process(delta):
	$Area2D/AnimatedSprite.play()

func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		body.add_coin()
		queue_free()
