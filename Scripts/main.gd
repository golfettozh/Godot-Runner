extends Node2D

var ponts := 0.0
@onready var label_score: Label = $CanvasLayer/LabelScore
@onready var game_over_layer: CanvasLayer = $GameOverLayer

func _process(delta: float) -> void:
	ponts += delta*5
	label_score.text = "Score: " + str(int(ponts))

func _physics_process(delta: float) -> void:
	if GameManager.obj_speed < GameManager.max_obj_speed:
		GameManager.obj_speed += GameManager.obj_acceleration*delta
	
	if GameManager.world_speed < GameManager.max_world_speed:
		GameManager.world_speed += GameManager.world_acceleration*delta
	
func on_player_dead():
	GameManager.reset_var()
	
	var final_ponts = int(ponts)
	if final_ponts>GameManager.high_score:
		GameManager.high_score = final_ponts
		GameManager.save_high_score()
		
	game_over_layer.show_game_over(int(ponts), int(GameManager.high_score))
