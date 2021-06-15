extends BattleUnit

class_name Slime

const max_h = 10
const max_e = 2
const defined_skills = ["bash"]

func _init().("Slime", max_h, max_e, defined_skills):
  pass

func get_next_action() -> Skill:
  return null