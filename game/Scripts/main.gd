extends Node3D

@onready var enemy = preload("res://Scenes/enemy.tscn")
@onready var enemy_script = preload("res://Scripts/Enemy.gd")

var enemies = 2
var enemies_alive = 10

@onready var player = $player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_tree().call_group("enemies","update_target_location",player.global_transform.origin)
	
	if enemies <= enemies_alive:
		enemies+=1
		spawn_enemy()
	
func spawn_enemy():
	var new_enemy = enemy.instantiate()
	new_enemy.set_position(Vector3(randi_range(player.position.x,player.position.x+100),1,randi_range(player.position.z-100,player.position.z)))
	new_enemy.set_script(enemy_script)
	add_child(new_enemy)


func _on_button_pressed():
	get_tree().reload_current_scene()
