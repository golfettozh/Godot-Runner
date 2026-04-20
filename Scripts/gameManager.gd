extends Node

# Velocidade do mundo para dar efeito parallax
var world_speed := 50.0
var max_world_speed := 400.0
var world_acceleration := 2.0

# Velocidade dos enemigos e dos objs
var obj_speed := 70.0
var max_obj_speed := 500.0
var obj_acceleration := 2.0

var high_score := 0.0
const PATH := "user://savegame.dat"

func _ready() -> void:
	load_high_score()

func load_high_score():
	if FileAccess.file_exists(PATH):
		var file = FileAccess.open(PATH, FileAccess.READ)
		high_score = file.get_var()
		
		file.close()
	else:
		high_score = 0
		
func save_high_score():
	
	var file = FileAccess.open(PATH, FileAccess.WRITE)
	file.store_var(high_score)
	
	file.close()

func reset_var():
	world_speed = 50
	obj_speed = 70
