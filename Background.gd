extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (Texture) var texture setget _set_texture


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _set_texture(value):
	texture = value
	
	update()


func _draw():
	draw_texture(texture,Vector2())
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
