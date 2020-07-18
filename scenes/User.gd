extends Node2D

onready var rng=RandomNumberGenerator.new()

var username := "";
var pos := Vector2();
var target:Vector2;


const speed := 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	$TimerMovement.start()

func place(name, pos):
	self.username = name
	self.pos = pos
	$Username.text = self.username
	position = pos
	pass
	
func setMessage(message):
	$Message.text = message
	print("nouveau message:"+message)
	$TimerMessage.start()


func _on_Timer_timeout():
	$Message.text = ""
	pass # Replace with function body.

func _physics_process(delta):
	position = lerp(position,target,delta*speed)

func _on_TimerMovement_timeout():
	target.x = rng.randf_range(-1, 1)*100;
	target.y = rng.randf_range(-1, 1)*100;
	var rect=get_viewport_rect().size
	target.x=clamp(position.x+target.x,0,rect.x)
	target.y=clamp(position.y+target.y,0,rect.y)
