extends Reference

class_name BattleUnit

var max_health : int
var max_energy : int
var current_health : int
var current_energy : int

var target_health : int
var decay_rate = 1;

var skills : Array = []
var status : Array = []

const BattleConstants = preload("battle_constants.gd")
onready var battle_constants : BattleConstants = BattleConstants.new()

func get_max_health() -> int:
    return max_health

func get_max_energy() -> int:
    return max_energy

func get_cur_health() -> int:
    return current_health

func get_cur_energy() -> int:
    return current_energy;

func modify_health(mod : int):
    if !status.has(battle_constants.STATUS.UNCONSCIOUS):
        target_health += mod;

    if target_health >= current_health:
        current_health = target_health
    else:
        target_health = min(target_health, 0) as int

func modifyEnergy(mod : int):
    if !status.has(battle_constants.STATUS.UNCONSCIOUS):
        current_energy += mod;

func knock_out():
    status.clear()
    status.push_back(battle_constants.STATUS.UNCONSCIOUS)
    target_health = 0
    current_health = 0
    current_energy = 0

func revive(rev_health : int, rev_energy : int):
    status.clear()
    target_health = rev_health
    current_health = rev_health
    current_energy = rev_energy

func getNextAction():
    pass
