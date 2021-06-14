extends Reference

class_name Skill

var name : String

# Can be 'health' or 'status'
var type : String

# Can be '0.00, .10, or 0.15'
# Can be 'none', 'low', or 'medium'
var crit_chance : String

# Used to flag whether the target will directly benefit from the action
var helpful_to_target : bool

# Can be '+/-<status_effect>' or '+/-<numeric_value>'
var modifier : String

# Only used for 'health' actions. Can be 'precise', 'narrow', 'wide'
var num_range : String

func _init(skill_name, skill_type, skill_crit_chance, skill_helpful_to_target, 
           skill_modifier, skill_num_range):
    self.name = skill_name
    self.type = skill_type
    self.crit_chance = skill_crit_chance
    self.helpful_to_target = skill_helpful_to_target
    self.modifier = skill_modifier
    self.num_range = skill_num_range

func skill_name() -> String:
    return name

func affects_health() -> bool:
    return type == "health"

func affects_status_conditions() -> bool:
    return type != "health"

func is_helpful() -> bool:
    return helpful_to_target

func get_crit_chance() -> float:
    match (crit_chance):
        "none":
            return 0.0
        "low":
            return 0.1
        "medium":
            return 0.2
        _:
            return 0.0

func get_range_modifier() -> float:
    if (affects_status_conditions()):
        return 0.0

    match (num_range):
        "precise":
            return 0.0
        "narrow":
            return 0.2
        "wide":
            return 0.35
        _:
            return 0.0

func _to_string():
    var result : String = "[%s; type=%s,crit-chance=%s,helpful=%s,modifier=%s,range=%s]"
    return result % [self.name, self.type, self.crit_chance, self.helpful_to_target, self.modifier, self.num_range]