extends Reference

var unit_definitions : Dictionary = {}

var skill_definitions : Dictionary

func _init(skills : Dictionary):
    self.skills = skills

func get_unit_type(type : String):
    return unit_definitions[type]

func initialize_unit_definitions():
    pass

func load_unit_definition(type : String):
    var unitDefinition = load("res://enemy_units/%s.gd" % type)

    var base_unit : BattleUnit = unitDefinition.new() as BattleUnit

    var skills = []
    for skill_name in base_unit.defined_skills:
        skills.push_back(skill_definitions[skill_name])
    
    base_unit.skills = skills

    self.unit_definitions[base_unit.unit_name] = base_unit