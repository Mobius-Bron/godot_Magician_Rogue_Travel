extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var grahpic: Node2D = $Grahpic
var SPEED = 100.0
var direction

var weapon_root
var weapon

var mouse_position
var mouse_local_position

func _ready():
	weapon_root = $weapon_root
	weapon = $weapon_root/weapon_node

func _physics_process(delta):
	move()
	animation_handler()
	weapon_aim()
	
func move():
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	direction.y *= 0.5
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
		
func weapon_aim():
	mouse_position = get_global_mouse_position()
	mouse_local_position = get_local_mouse_position()
	
	if mouse_local_position.x > 0:
		weapon.scale.y = 1
	elif mouse_local_position.x < 0:
		weapon.scale.y = -1
	
	weapon_root.look_at(mouse_position)
