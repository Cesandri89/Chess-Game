extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var active = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("normal")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$circle.draw_circle(Vector2(50,50),50,Color.blue)
	
	
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
					
		