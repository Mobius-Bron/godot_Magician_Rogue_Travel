extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var grahpic: Node2D = $Grahpic
var SPEED = 100.0
var direction

func _physics_process(delta):
	move()
	animation_handler()
	
func move():
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	direction.y *= 0.58
	velocity = direction * SPEED
	if direction.x < 0:
		grahpic.scale.x = -1
	elif direction.x >0:
		grahpic.scale.x = 1
	move_and_slide()

func animation_handler():
	if direction.x == 0 and direction.y == 0:
		animation_player.play("idle")
	else:
		animation_player.play("run")
