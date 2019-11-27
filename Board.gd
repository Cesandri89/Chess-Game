extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var mudcrawler 
export (PackedScene) var label
export (PackedScene) var not_possible
var active = true # ob sich der Kreis bewegt
var counter = 0 # ob eine Figur zum Setzten ausgewaehlt ist
var a = null # represent the mudcrawler instance
var board =  [] # print the chess board
#print(board)
var menu_visible = true
var x = 0 # x index of board starting with 0
var y = 0 # y index of board starting with 0
var line = ""
var mon_count = 0 # how many monsters are placed in the board
var hello = "hello" 
var cross = preload("res://Cross.tscn")
var active_player # one or two
var gold1 #inizialize gold amount of player1
var gold2 #inizialize gold amount of player2
# Called when the node enters the scene tree for the first time.
func _spawn_monster(active_player):
	var a = mudcrawler.instance()
	a.add_to_group("monsters")
	a.player_tag = active_player
	if active_player == 1:
		x = 0
		y = 0
	else:
		x = 13
		y = 1
		
	#l.text = "mp " + str(a.moving_points)
	#l.add_color_override("font_color", Color.blue)
	#l.rect_position = Vector2(a.position.x + 5, a.position.y + 80)
	add_child(a)
	counter += 1




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
	
	$MenuBackground.hide()
	var menu_objects = get_tree().get_nodes_in_group("menu_objects")
	for e in menu_objects:
		e.hide()
	menu_visible = false
	gold1 = 100
	gold2 = 100
	active_player = 1
	# create empty array
	for y in range(7):
		board.append([])
		board[y].resize(13)
		for x in range(13):
			board[y][x] = 0
			
	print("empty board:")
	prettyprint(board)
	#x = 0
	#y = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/Gold_Player1.text = "Gold: " + str(gold1)
	$HUD/Gold_Player2.text = "Gold: " + str(gold2) 
	if active_player == 1:
		$HUD/Player1.modulate = Color.lightblue
		$HUD/Player2.modulate = Color.black
	elif active_player == 2:
		$HUD/Player2.modulate = Color.lightblue
		$HUD/Player1.modulate = Color.black
	#elif $ButtonTimer.is_stopped():
	#	$Button.text = "Attack"
	
	if mon_count < 4:
		$Button.hide()
	else:
		$Button.show()
	
	if Input.is_action_just_pressed("c"):
		if active_player == 1:
			active_player = 2
		else:
			active_player = 1
			
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
			_spawn_monster(active_player)
		
	
	if Input.is_action_just_pressed("enter"):
		print(counter)
		if counter == 1:
			#if active_player == 1 and gold1 > 5:
			#	_spawn_monster()
				
			print("figure active!")
			if board[y][x] == 0:
				board[y][x] = 1
				counter = 0
				mon_count += 1
				prettyprint(board)
				#spawn_x(y, x) 
				x = 0
				y = 0
				Globals.occupato = false
			
				
				
			else:
				print("x, y : ", x, y )
				Globals.occupato = true
				print(board)
				var f = not_possible.instance()
				add_child(f)
				f.rect_position = Vector2( x* 100 + 10, y * 100)
				#var f = Label.new()
				#f.text = "not possible"
				#f.modulate = Color.red
				#var t = Tween.new()
				#f.add_child(t)
				#add_child(f)
				#t.interpolate_property(f, "rect_position", Vector2(x * 100 + 10, y * 100), Vector2(x * 100, y * 100 - 200), 3.0 , Tween.TRANS_LINEAR, Tween.EASE_OUT )
				#t.start()
				
				
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
	
	#for m in minions:
		#m.animation = true 
	#	m._move(100,0)
		#m.moving = false
		
		#if m.moving == true:
		#	locked = true
		#	break 
	for m in minions:
		if m.locked:
			$ButtonTimer.start()
			$Button.text = "Wait.."
			
			for c in crosses:
						c.queue_free()
		
		else:
			# move the little figures
			for m in minions:
				#if m.position.x < 1250:
				print(board[x])
				#e._move()
				print("i am at postiont", m.position.x)			
				var direction = 0
				if active_player == 1:
					direction = 1
				else:
					direction = -1
				
				m._move(100 * direction ,0)
				#m.moving = true	
				#m.new_position = m.position + Vector2(100,0)
					
				

func spawn_x(y,x):

	var c = cross.instance()
	#c.position.x = get_parent().board[x][y]

	c.position = Vector2(50+ x * 100,50+ y * 100)
	c.add_to_group("crosses")	

	add_child(c)
	
func _on_ButtonTimer_timeout():
	print("ciao")
	$Button.text = "Attacca"
	

func _on_Purchase_Monster_button_down():
	if  gold1 >= 5:
		if counter == 0:
			_spawn_monster(active_player)
			gold1 -= 5


func _on_MenuButton_button_down():
	var menu_objects = get_tree().get_nodes_in_group("menu_objects")
	if menu_visible == false:
		$MenuBackground.show()
		for e in menu_objects:
			e.show()
			
		menu_visible = true
		$MenuBackground.modulate = Color(0,0,0,0.1)
		$MenuBackground.rect_size = Vector2(1300,70)
		
		
	else:
		$MenuBackground.hide()
		for e in menu_objects:
			e.hide()
		menu_visible = false
		
		
	



	
