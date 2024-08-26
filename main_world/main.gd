extends Node2D

var bullet = preload("res://weapon/bullet/butten.tscn")
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = $player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fire_click"):
		var new_bullet = bullet.instantiate()
		new_bullet.position = player.bullet_position()
		new_bullet.rotation = player.bullet_rotation()
		add_child(new_bullet)
