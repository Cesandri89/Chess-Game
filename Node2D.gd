extends Node2D

export (Texture) var texture setget _set_texture
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var screensize

func _set_texture(value):
    # If the texture variable is modified externally,
    # this callback is called."res://icon.png"
    texture = value #texture was changed
    update() # update the node


# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport_rect().size

func _draw():
	draw_texture(texture,Vector2())
	
	for x in range(0,10):
		print(screensize.x / 10 * x)
		draw_line(Vector2(screensize.x / 10 * x,0),Vector2(screensize.x / 10 * x,screensize.y),Color(30,40,110),2)
	for y in range(0,10):
		draw_line(Vector2(0,screensize.y / 10 * y), Vector2(screensize.x,screensize.y / 10 * y), Color(30,40,110),2) 
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screensize = get_viewport_rect().size
	print(screensize)