extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var active = true
var moving
var new_position
var board = load("res://Board.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("normal")
	
	new_position = Vector2(0,0)
	moving = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$circle.draw_circle(Vector2(50,50),50,Color.blue)
	if moving:
		$AnimatedSprite.play("walk")
		if self.position.x < self.new_position.x:
		    	self.position.x += 1
		else:
			self.position = self.new_position
			$AnimatedSprite.play("normal")
			self.moving = false
		
	else:
		$AnimatedSprite.play("normal")
	
	if active:
		if Input.is_action_just_pressed("enter"):
			$circle.modulate = Color.red
		
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

func _move():
	pass
	#TweetNode.interpolate_property(self, "transform/position", get_position(),
	# Vector2(position.x + 100, 0), 1.0,
	# Tween.TRANS_BACK, Tween.EASE_IN)
	#TweetNode.start()





