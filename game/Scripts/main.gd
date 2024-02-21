extends Node3D

@onready var enemy = preload("res://Scenes/enemy.tscn")
@onready var enemy_script = preload("res://Scripts/Enemy.gd")
var enemies = 10

@onready var player = $player

func _ready():
	randomize()
	for i in range(10):
		spawn_enemy()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_tree().call_group("enemies","update_target_location",player.global_transform.origin)
	
	if enemies <10:
		enemies+=1
		spawn_enemy()
	
func spawn_enemy():
	var new_enemy = enemy.instantiate()
	new_enemy.set_position(Vector3(randi_range(player.position.x-50,player.position.x+50),1,randi_range(player.position.z-50,player.position.z+50)))
	new_enemy.set_script(enemy_script)
	add_child(new_enemy)
