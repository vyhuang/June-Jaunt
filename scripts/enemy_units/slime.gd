extends BattleUnit

class_name Slime

const max_h = 10
const max_e = 2

func _init().("Slime", max_h, max_e, ["bash"]):
  pass

func get_next_action() -> Skill:
  return null
