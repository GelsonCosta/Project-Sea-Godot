extends Area2D

export var speed=400;
var screen_size;

signal hit;

func _ready():
	hide()
	screen_size= get_viewport_rect().size;
	pass # Replace with function body.

func _process(delta):
	
	tela(InputEventScreenTouch)
	
	
	var velocity=Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x+=1
	if Input.is_action_pressed("ui_left"):
		velocity.x-=1
	if Input.is_action_pressed("ui_down"):
		velocity.y+=1
	if Input.is_action_pressed("ui_up"):
		velocity.y-=1
	
	if velocity.length()>0:
		velocity=velocity.normalized()*speed
		$AnimatedSprite.play()
		$Tail.emitting=true
	else:
		$AnimatedSprite.stop()
	position.x+=velocity.x*delta
	position.y+=velocity.y*delta
#	$Tail.emitting=false
	
	if velocity.x!=0:
		$AnimatedSprite.animation="direita"
		$AnimatedSprite.flip_v=false
		$AnimatedSprite.flip_h= velocity.x<0
	if velocity.y!=0:
		$AnimatedSprite.animation="cima"
		$AnimatedSprite.flip_h=false
		$AnimatedSprite.flip_v= velocity.y>0
	
	
	position.x=clamp(position.x,0,screen_size.x)
	position.y=clamp(position.y,0,screen_size.y)
	
	pass 
func start(pos):
	position=pos
	show()
	$CollisionShape2D.disabled=false
	
	


func _on_player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled",true)
	pass # Replace with function body.

func tela(event):
	if event is InputEventScreenTouch:
		var pos= (event.position-get_viewport().size*0.5).normalized()
		position=pos
