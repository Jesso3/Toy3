extends RichTextLabel

func _ready():
	$"../Game Over".size = Vector2(0,0)

func _process(delta):
	var string =  "use your sword to kill %s more enemies"
	$".".set_text(string % $"..".enemies_alive)
	
	if $"..".enemies_alive == 0:
		$"../Game Over".size = Vector2(736,256)
		$"../Button".visible = true
		$"../player".SPEED = 0
		$"../player".JUMP_VELOCITY = 0
