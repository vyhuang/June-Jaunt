extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const BattleConstants = preload("res://scripts/battle_constants.gd")
onready var battle_constants : BattleConstants = BattleConstants.new()

var state

var opponents = []
var allies = []

# Called when the node enters the scene tree for the first time.
func _ready():
  state = battle_constants.BATTLE_STATE.PAUSED
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta): 
  check_battle_end()
  if (state == battle_constants.BATTLE_STATE.DEFEAT):
    # ask the player to start from last save point
    print("Defeat!")
    pass
  if (state == battle_constants.BATTLE_STATE.VICTORY):
    # display victory screen
    print("Victory!")
    pass
  pass

func check_battle_end():
  if (state != battle_constants.BATTLE_STATE.IN_BATTLE):
    return
  # Check for victory
  if (side_in_battle_defeated(opponents)):
    state = battle_constants.BATTLE_STATE.VICTORY
    return
  # Check for defeat
  if (side_in_battle_defeated(allies)):
    state = battle_constants.BATTLE_STATE.DEFEAT

func side_in_battle_defeated(side : Array) -> bool:
  if side.size() > 0:
    for opponent in opponents:
      if !opponent.status.has(battle_constants.STATUS.UNCONSCIOUS):
        return false
  return true
