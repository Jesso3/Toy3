extends RigidBody3D

@onready var player = $".."

signal bullet_hit

# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0 
	linear_velocity.z = -35# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if position.y <= 0:
		queue_free()

		
	
