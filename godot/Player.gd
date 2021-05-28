extends KinematicBody2D

const SPEED = 300
const FLOOR = Vector2(0, - 1)
const GRAVITY = 970 
const JUMP_POWER = 600
const DOUBLE_JUMP_POWER = 850
const WEAPON = preload("res://Weapon.tscn")

var is_firing = false
var is_hurt = false
var is_death = false
var velocity = Vector2()

var coins = 0
var hp = 100


func add_coin():
	$Coins.volume_db = Global.sounds
	$Coins.play()
	coins += 1

func add_hp():
	$HP.volume_db = Global.sounds
	$HP.play()
	if !hp >= 100:
		hp += 20

func remove_hp():
	hp -= 20

	if hp <= 0:
		die()
	else:
		$CollisionPolygon2D.set_deferred("disabled", true)
		is_hurt = true
		$AnimatedSprite.play("hurt")
	
func die():
	$AnimatedSprite.play("death")
	$CollisionPolygon2D.set_deferred("disabled", true)
	is_death = true
	
func _physics_process(delta):
	if is_death:
		return

	if is_firing == true :
		return
	elif is_hurt == true:
		return
	
	if position.y > 1200:
		get_tree().change_scene("res://DeathScreen.tscn")
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false
		$Position2D.position.x = abs($Position2D.position.x)
		if is_on_floor():
				$AnimatedSprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true
		$Position2D.position.x = abs($Position2D.position.x) * -1
		if is_on_floor():
				$AnimatedSprite.play("walk")
	else:
		velocity.x = 0
		if is_on_floor():
				$AnimatedSprite.play("idle")
	
	if Input.is_action_pressed("ui_up") && is_on_floor():
		velocity.y = -JUMP_POWER
		if is_on_floor():
				$AnimatedSprite.play("jump")
	elif Input.is_action_pressed("ui_accept") && is_on_floor():
		velocity.y = -DOUBLE_JUMP_POWER
		if is_on_floor():
				$AnimatedSprite.play("jump")
				
	if Input.is_action_just_pressed("ui_select") && is_firing == false && is_on_floor():
		is_firing = true
		$AnimatedSprite.play("attack")	
		$Attack.volume_db = Global.sounds - 5
		$Attack.play()
		var weapon = WEAPON.instance()
		weapon.direction = sign($Position2D.position.x)
		weapon.position = $Position2D.global_position
		get_parent().add_child(weapon)
	
	velocity.y += (GRAVITY * delta)
	velocity = move_and_slide(velocity, FLOOR)



func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack":
		is_firing = false
	elif $AnimatedSprite.animation == "hurt":
		is_hurt = false
		$CollisionPolygon2D.set_deferred("disabled", false)
	elif $AnimatedSprite.animation == "death":
		get_tree().change_scene("res://DeathScreen.tscn")

