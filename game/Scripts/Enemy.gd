extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D
@onready var player = $"../player"
@onready var main_script = preload("res://Scripts/main.gd")

@export var speed = 10

func _process(delta):
	var curren_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - curren_location).normalized() * speed
	
	
	velocity = velocity.move_toward(new_velocity,.25)
	move_and_slide()
	
	if position.distance_to(player.position) > 75:
		$"..".enemies-=1;
		queue_free()
	
	
func update_target_location(target_location):
	nav_agent.set_target_position(target_location)


func _unhandled_input(event):
	if (event is InputEventMouseButton && event.is_action_pressed("click")):
		if position.distance_to(player.position) < 2:
			$"..".enemies_alive -= 1
			$"..".enemies-=1;
			$"../sword_sound".play()
			queue_free()

