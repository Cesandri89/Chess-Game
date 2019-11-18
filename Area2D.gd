extends Area2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var active = true
var animating
var new_position
#export (PackedScene) var label
var board = load("res://Board.gd")
var moving_points = 0
var moving_bonus = 2
var moving_cost = 5 #per grid
var l
var pos
var locked = false
var borders
var blocked

# Called when the node enters the scene tree for the first time.
func _ready():
	blocked = false
	borders = get_tree().get_nodes_in_group("borders")
	l = Label.new()
	$AnimatedSprite.play("normal")
	
	new_position = Vector2(0,0)
	animating = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pos = position
	l.text = "moving points " + str(moving_points) 
	l.rect_position = Vector2(position.x, position.y + 25) 
	#$circle.draw_circle(Vector2(50,50),50,Color.blue)
	if blocked == false:
		if animating:
			$AnimatedSprite.play("walk")
			$circle.hide()
		
			#if self.position.x < self.new_position.x:
			#	self.position.x += 1
			#else:
			#	self.position = self.new_position
			#	$AnimatedSprite.play("normal")
				#self.moving = false
			
		else:
			$AnimatedSprite.play("normal")
		
	if active:
		$AnimationPlayer.play("effect")
		
		if Input.is_action_just_pressed("enter"):
			if Globals.occupato == false:
				$circle.modulate = Color.red
				$AnimationPlayer.stop()
				active = false
					
		if Input.is_action_just_pressed("ui_right"):
			# move right
			print("right")
			if position.x < 1250:
				position += Vector2(100,0)
		
		if Input.is_action_just_pressed("ui_left"):
			# move right
			print("left")
			if position.x > 50:
				position += Vector2(-100,0)
		if Input.is_action_just_pressed("ui_down"):
			# move right
			print("down")
			if position.y < 600:
				position += Vector2(0,100)
		if Input.is_action_just_pressed("ui_up"):
			# move right
	
			print("up")
			if position.y > 50:
				position += Vector2(0,-100)

func teleport(player):
	if player == 1:
		#move right 
		position.x += 100
	else:
		position.x -= 100

func _move(x,y):
	if blocked == false:
		print("moving..")
		locked = true
		$Tween.interpolate_property(self,"position", pos , Vector2(pos.x + x, pos.y + y), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
				#$AnimatedSprite.play("normal")
		
		
		print("ciao")
		$AnimatedSprite.play("walk")
		$Tween.start()
		$circle.hide()
		animating = true
				#$AnimatedSprite.play("normal")
		#TweetNode.interpolate_property(self, "transform/position", get_position(),
		# Vector2(position.x + 100, 0), 1.0,
		# Tween.TRANS_BACK, Tween.EASE_IN)
		#TweetNode.start()
		






func _on_Tween_tween_completed(object, key):
	locked = false
	animating = false


func _on_Area2D_area_entered(area):
	if area in borders:
		#position.x = 1250
		$Tween.stop_all()
		blocked = true
		$AnimatedSprite.stop()
		#$Tween.queue_free()
