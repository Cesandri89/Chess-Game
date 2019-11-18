extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time

# Called when the node enters the scene tree for the first time.
func _ready():
	time = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time > 2:
		queue_free()
	rect_position.y -= 20 * delta		





