extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var grahpic: Node2D = $Grahpic
var weapon_dict: Dictionary = {0: preload("res://weapon/weapons/gun.tres"), 1: preload("res://weapon/weapons/fire_magic.tres")}
var max_weapon_num = 2
var now_weapon_num = 0

var SPEED = 100.0
var direction

var weapon_root
var weapon_node
var weapon

var mouse_position
var mouse_local_position

func _ready():
	weapon_root = $weapon_root
	weapon_node = $weapon_root/weapon_node
	weapon = $weapon_root/weapon_node/weapon_test
	print(weapon_dict)

func _physics_process(delta):
	move()
	animation_handler()
	weapon_change()
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
		weapon_node.scale.y = 1
	elif mouse_local_position.x < 0:
		weapon_node.scale.y = -1
	
	weapon_root.look_at(mouse_position)
	
func weapon_change():
	if Input.is_action_just_pressed("weapon_change"):
		now_weapon_num = (now_weapon_num + 1) % max_weapon_num
		#print(now_weapon_num,":",weapon_dict[now_weapon_num].get_position())
		weapon.frame_coords = weapon_dict[now_weapon_num].id
		weapon.position = weapon_dict[now_weapon_num].Position
		
func bullet_position():
	return weapon_node.get_global_position()

func bullet_rotation():
	return weapon_node.get_global_rotation()
		
