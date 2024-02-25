extends Node3D

@onready var enemy = preload("res://Scenes/enemy.tscn")
@onready var enemy_script = preload("res://Scripts/Enemy.gd")
@onready var bullet = preload("res://Scenes/bullet.tscn")
@onready var bullet_script = preload("res://Scripts/bullets.gd")
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
	
func _unhandled_input(event):
	if (event is InputEventMouseButton && event.is_action_pressed("click")):
		spawn_bullet()

func spawn_enemy():
	var new_enemy = enemy.instantiate()
	new_enemy.set_position(Vector3(randi_range(player.position.x-50,player.position.x+50),1,randi_range(player.position.z-50,player.position.z+50)))
	new_enemy.set_script(enemy_script)
	add_child(new_enemy)
	
func spawn_bullet():
	var new_bullet = bullet.instantiate()
	new_bullet.set_position(Vector3(player.position.x-5.5,player.position.y,player.position.z))
	new_bullet.set_script(bullet_script)
	add_child(new_bullet)
