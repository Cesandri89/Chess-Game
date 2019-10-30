extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var mudcrawler 
var active = true
var counter = 0
var a = null
var board =  []
#print(board)
var x = 0
var y = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	for y in range(8):
		board.append([])
		board[y].resize(13)
		for x in range(13):
			board[y][x] = 0

	#var board = []
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("ui_left"):
		if counter == 1 and x > 0:
			x -= 1
			print(x,y)
			
	if Input.is_action_just_pressed("ui_right"):
		if counter == 1 and x < 13:
			x += 1
			print(x,y)
			
	if Input.is_action_just_pressed("ui_up"):
		if counter == 1 and y > 0:
			y -= 1
			print(x,y)
	if Input.is_action_just_pressed("ui_down"):
		if counter == 1 and y < 8:
			y += 1
			print(x,y)
	
			
	
	if Input.is_action_just_pressed("b"):
		
		# create new
		if counter == 0:
			var a = mudcrawler.instance()
			add_child(a)
			a.position = Vector2(50,50)
			counter += 1
		
	if Input.is_action_just_pressed("enter"):
		#if counter == 1:
		board[y][x] = 1
		counter = 0
		print(board)
			
		
	#if Input.is_action_just_pressed("
		
		
		
		
		