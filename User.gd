extends Node2D

var username = "";
var pos = Vector2();

var timeout_timer = 1

const speed = 100;

onready var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	pass # Replace with function body.

func place(name, pos):
	self.username = name
	self.pos = pos
	$Username.text = self.username
	position = pos
	pass
	
func setMessage(message):
	$Message/Timer.stop()
	$Message.text = message
	$Message/Timer.start(timeout_timer)

func _process(delta):
	position.x += rng.randi_range(-1, 1)*delta*speed;
	position.y += rng.randi_range(-1, 1)*delta*speed;

func _on_Timer_timeout():
	$Message.text = ""
	pass # Replace with function body.
