extends KinematicBody2D

class_name User

var username := "";
var target:Vector2;

const speed := 80;
const g = 981
var velocity:Vector2;

var level:int = 0;
var min_xp:int = 0;
var max_xp:int = 0;
var xp:int = 0;
var points:int = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	# calcul du niveau en fonction de l'xp
	compute_level()
	
	target.x = position.x

func place(name, pos):
	self.username = name
	self.position = pos
	$Username.text = self.username
	position = pos
	pass
	
func setMessage(message):
	$Message.text = message
	$TimerMessage.start()
	
func updateXpBar():
	$XpBar.value = xp;

func _on_Timer_timeout():
	$Message.text = ""
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = clamp(target.x - position.x, -1, 1) * speed
	velocity.y += g * delta
	$Sprite.set_flip_h(velocity.x > 0);

	velocity = move_and_slide(velocity, Vector2.UP)
	
func update_banner_color(color:Color):
	$Banner/Foreground.self_modulate = color

func compute_level():
	for l in LevelControler.levels:
		if xp < LevelControler.levels[l]:
			break
		level = l
	$XpBar.min_value = LevelControler.levels[level]
	$XpBar.max_value = LevelControler.levels[level+1]
	$Level.text = String(level)

func addXp(value):
	xp += value
	compute_level()
