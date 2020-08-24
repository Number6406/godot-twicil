extends Node2D


export var userList:NodePath;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	for user in get_node(userList).get_children():
		user.addXp(5)
		user.points += 2
		user.updateXpBar()
	pass # Replace with function body.
