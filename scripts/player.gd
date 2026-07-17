extends CharacterBody2D

var speed = 100
var last_direction = "down"

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	velocity = direction * speed
	move_and_slide()

	update_animation(direction)


func update_animation(direction):
	if direction.length() > 0:
		if direction.y > 0:
			last_direction = "down"
		elif direction.y < 0:
			last_direction = "up"
		elif direction.x > 0:
			last_direction = "right"
		elif direction.x < 0:
			last_direction = "left"

		animated_sprite.play("walk_" + last_direction)
	else:
		animated_sprite.play("idle_" + last_direction)
