extends Area2D

var offScreen_x := -50.0

func _physics_process(delta: float) -> void:
	position.x -= GameManager.obj_speed * delta
	
	if position.x < offScreen_x:
		queue_free()
