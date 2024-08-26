extends CharacterBody2D

var timer
var speed = 300
var vector: Vector2 = Vector2(1,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = $Timer
	timer.start()
	vector.x = cos(rotation)
	vector.y = sin(rotation)


func _process(delta):
	velocity = vector * speed
	move_and_slide()


func _on_timer_timeout():
	queue_free()
