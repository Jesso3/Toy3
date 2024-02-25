extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D
@onready var player = $"../player"
@onready var main_script = preload("res://Scripts/main.gd")

@export var speed = 3

@export var emitter:Node3D

func _ready() -> void:
	emitter.bullet_hit.connect(hi)

func _process(delta):
	var curren_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - curren_location).normalized() * speed
	
	if position.distance_to(player.position) < 25:
		velocity = velocity.move_toward(new_velocity,.25)
		move_and_slide()
	
	if position.distance_to(player.position) > 75:
		$"..".enemies-=1;
		print($"..".enemies);
		queue_free()
	
	
func update_target_location(target_location):
	nav_agent.set_target_position(target_location)

func hi():
	print("hi")



