extends CharacterBody3D

@onready var player = $"../player"

@export var speed = 4

@onready var nav_agent = $NavigationAgent3D

func ready():
	pass
	
func _physics_process(delta):
	
	velocity = Vector3.ZERO
	nav_agent.set_target_position(player.global_transform.origin)
	var next_nav_point = nav_agent.get_next_path_position()
	if position.distance_to(player.position) < 25:
		velocity = (next_nav_point - global_transform.origin).normalized() * speed
		move_and_slide()
	
	
		
