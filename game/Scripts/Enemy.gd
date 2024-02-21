extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D
@onready var player = $"../player"

@export var speed = 3

func _physics_process(delta):
	var curren_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - curren_location).normalized() * speed
	
	if position.distance_to(player.position) < 25:
		velocity = new_velocity
		move_and_slide()
	
func update_target_location(target_location):
	nav_agent.set_target_position(target_location)


	
	
		
