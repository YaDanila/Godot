extends Node2D

var camera: Camera2D
var state: int


func _ready() -> void:
	camera = get_node("Camera2D")

func _physics_process(delta: float) -> void:
	$AudioStreamPlayer.volume_db = Global.volume
	self.position.x += 30 * delta



func _on_Exit_pressed():
	get_tree().quit()


func _on_Play_pressed():
	get_tree().change_scene("res://Level1.tscn")
