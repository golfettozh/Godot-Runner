extends Node2D

const ENEMY_FLY = preload("uid://c4lkes5tdvkoc")
const ITEM_COFFEE = preload("uid://dgjagisvl80mb")
const OBSTACLE_THORN = preload("uid://bdc2rqlvqwyhv")
const ENEMY_GROUND = preload("uid://cs638eqqdgqei")

const GROUND_Y = 150
const FLYING_MIN_Y = 50
const FLYING_MAX_Y = 120
const COFFEE_Y = 145

func _on_timer_spawn_timeout() -> void:
	spawn_object()

func spawn_object():
	var random_number := randi() % 100
	var packet: PackedScene
	if random_number < 6:
		packet = ITEM_COFFEE
	elif random_number < 36:
		packet = ENEMY_FLY
	elif random_number < 81:
		packet = ENEMY_GROUND
	else:
		packet = OBSTACLE_THORN
	var inst = packet.instantiate()
	inst.position.x = get_viewport_rect().size.x + 20
	
	if packet == ENEMY_FLY:
		inst.position.y = randf_range(FLYING_MIN_Y, FLYING_MAX_Y)
	elif packet == ENEMY_GROUND or packet == OBSTACLE_THORN:
		inst.position.y = GROUND_Y
	else:
		inst.position.y = COFFEE_Y
		
	get_parent().add_child(inst)
