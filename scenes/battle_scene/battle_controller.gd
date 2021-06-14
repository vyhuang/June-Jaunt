extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum STATE {IN_BATTLE, PAUSED, VICTORY, DEFEAT}
var state = STATE.PAUSED

var opponents = []
var allies = []

# Called when the node enters the scene tree for the first time.
func _ready():
  # test 1 2 3 4 5
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta): 
#	pass

func checkBattleEnd():
  if (state != STATE.IN_BATTLE):
    return
  pass
