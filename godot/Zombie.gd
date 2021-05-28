extends KinematicBody2D

const SPEED = 200
const FLOOR = Vector2(0, - 1)
const GRAVITY = 970 

var velocity = Vector2()
var direction = 1
var is_life = true
var is_attack = false

func kill():
	is_life = false
	velocity.x = 0
	$Hit.volume_db = Global.sounds
	$Hit.play()
	$AnimatedSprite.play("death")
	$CollisionPolygon2D.set_deferred("disabled", true)
	$DeathCollision.set_deferred("disabled", false)
	
func _physics_process(delta):
	if is_life == true && is_attack == false:
		velocity.x = SPEED * direction
		$AnimatedSprite.play("walk")
		
	velocity.y += (GRAVITY * delta)
	velocity = move_and_slide(velocity, FLOOR)
	if is_on_wall():
		change_direction()
	
func change_direction():
	direction *= -1
	$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
	$Area2D/CollisionShape2D.position.x *= -1


func _on_Area2D_body_entered(body):
	if is_life && "Player" in body.name:
		is_attack = true
		$AnimatedSprite.play("attack")
		$Attack.volume_db = Global.sounds - 5
		$Attack.play()
		body.remove_hp()
 

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack":
		is_attack = false
