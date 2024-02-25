extends RigidBody3D

@onready var player = $player

# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0 
	linear_velocity.z = -10# Replace with function body.


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if position.distance_to(player.position) > 50:
		#queue_free()
	

