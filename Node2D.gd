extends Node2D


var wrong = false

#export (Texture) var texture setget _set_texture
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var screensize

func _set_texture(value):
	# If the texture variable is modified externally,
	# this callback is called."res://icon.png"
	#texture = value #texture was changed
	update() # update the node


# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport_rect().size
	
func _draw():
	#draw_texture(texture,Vector2())
	for x in range(0,14):
	#	print(screensize.x / 10 * x)
	#	draw_line(Vector2(screensize.x / 10 * x,0),Vector2(screensize.x / 10 * x,screensize.y),Color(30,40,110),2)
		# vertical from left to right 
		draw_line(Vector2( x*100,0),Vector2(x*100,700),Color(30,40,110),2)
		
	for y in range(0,8):
		# horizontal lines from top to down
		draw_line(Vector2(0, y*100), Vector2(1300, y*100), Color(30,40,110),2) 



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
	screensize = get_viewport_rect().size
	
































