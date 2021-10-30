extends RigidBody2D

export var min_speed=150;
export var max_speed=300;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var tipo_inimigos=$AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation=tipo_inimigos[randi()%tipo_inimigos.size()]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
