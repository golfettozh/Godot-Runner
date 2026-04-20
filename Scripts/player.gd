extends CharacterBody2D

@export var gravity := 800.0
@export var jump_force := 350.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		animated_sprite_2d.play("jump")
		velocity.y += gravity*delta
	else:
		animated_sprite_2d.play("run")
		velocity.y = 0
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		
	
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("dangerous"):
		var main = get_tree().get_current_scene()
		main.on_player_dead()
	elif area.is_in_group("collectible"):
		area.queue_free()
		
