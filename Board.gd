extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var mudcrawler 
export (PackedScene) var label
var active = true
var counter = 0
var a = null
var board =  []
#print(board)
var x = 0
var y = 0
var line = ""
var mon_count = 0
var locked = false
var hello = "hello"
var cross = preload("res://Cross.tscn")
# Called when the node enters the scene tree for the first time.


func prettyprint(board):
	print(board)
	var x2 = 0
	var y2 = 0
	for y2 in range(board.size()):
		line = ""
		for x2 in range(board[y2].size()):
			line += "| "+ str(board[y2][x2]) + " | "
			
		print(line)


func _ready():
	# create empty array
	for y in range(7):
		board.append([])
		board[y].resize(13)
		for x in range(13):
			board[y][x] = 0
			

	print("empty board:")
	prettyprint(board)
	x = 0
	y = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#elif $ButtonTimer.is_stopped():
	#	$Button.text = "Attack"
	
	if mon_count < 4:
		$Button.hide()
	else:
		$Button.show()
	
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
			var l = Label.new()
			a.add_to_group("monsters")
			#l.text = "mp " + str(a.moving_points)
			#l.add_color_override("font_color", Color.blue)
			#l.rect_position = Vector2(a.position.x + 5, a.position.y + 80)
			l.add_to_group("labels")
			add_child(a)
			add_child(l)
			a.position = Vector2(50,50)
			counter += 1
		
	
	if Input.is_action_just_pressed("enter"):
		if counter == 1:
			if board[y][x] == 0:
				board[y][x] = 1
				counter = 0
				mon_count += 1
				prettyprint(board)
				spawn_x(y, x) 
				x = 0
				y = 0
				
			else:
				print(board)
				print("not possible")
	
	var labels = get_tree().get_nodes_in_group("labels")
	var minions = get_tree().get_nodes_in_group("monsters")
	for l in labels:
		for m in minions:
			#l.text = "mp " + str(m.moving_points)
			l.add_color_override("font_color", Color.blue)
			l.rect_position = Vector2(m.position.x + 5, m.position.y + 80)
			
				#$Node2D.draw_line(Vector2(50,50),Vector2(500,500),Color.red)
	#if Input.is_action_just_pressed("
		

func _on_Button_pressed():
	var minions = get_tree().get_nodes_in_group("monsters")
	var crosses = get_tree().get_nodes_in_group("crosses")
	print(crosses)
	print("hallo")
	
	locked = false
	for m in minions:
		if m.moving == true:
			locked = true
			break
	
	
	if locked == false:
		$ButtonTimer.start()
		$Button.text = "Wait.."
		
		for c in crosses:
					c.queue_free()
	
		# move the little figures
		for m in minions:
			#if m.position.x < 1250:
			print(board[x])
			#e._move()
			print("i am at postiont", m.position.x)			
			if m.position.x < 1250:
				m.moving = true	
				m.new_position = m.position + Vector2(100,0)
				
		

func spawn_x(y,x):

	var c = cross.instance()
	#c.position.x = get_parent().board[x][y]

	c.position = Vector2(50+ x * 100,50+ y * 100)
	c.add_to_group("crosses")	

	add_child(c)
	
func _on_ButtonTimer_timeout():
	print("ciao")
	$Button.text = "Attacca"
	
	
