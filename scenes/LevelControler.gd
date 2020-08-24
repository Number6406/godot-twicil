extends Node

var levels = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(0, 100):
		levels[x] = int(10 * x + pow(x, 3) * 0.05)
	pass # Replace with function body.
