extends CanvasLayer

@onready var label_record: Label = $LabelRecord
@onready var label_score: Label = $LabelScore

func _ready() -> void:
	visible = false
	
func show_game_over(current_score: int, hight_score: int):
	label_record.text = "Record: " + str(hight_score)
	label_score.text = "Score: " + str(current_score)
	visible = true
	get_tree().paused = true

func _unhandled_input(event: InputEvent) -> void:
	if visible and event.is_action_pressed("restart"):
		get_tree().paused = false
		get_tree().reload_current_scene()
