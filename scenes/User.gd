extends KinematicBody2D

class_name User

var username := "";
var target:Vector2;

const speed := 80;
const g = 981
var velocity:Vector2;

var xp:int = 0;
var points:int = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	target.x = position.x

func place(name, pos):
	self.username = name
	self.position = pos
	$Username.text = self.username
	position = pos
	pass
	
func setMessage(message):
	$Message.text = message
	print("nouveau message:"+message)
	$TimerMessage.start()
	
func updateXpBar():
	$XpBar.value = xp;

func _on_Timer_timeout():
	$Message.text = ""
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = clamp(target.x - position.x, -1, 1) * speed
	velocity.y += g * delta
	velocity = move_and_slide(velocity, Vector2.UP)
