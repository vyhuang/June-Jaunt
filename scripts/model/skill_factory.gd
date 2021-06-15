extends Reference

class_name SkillFactory

# what am I doing, geez.
# const Skill = preload("res://scripts/model/skill.gd")
var skills

func get_all_skills() -> Array:
    if skills == null:
        skills = parse_skills()
    return skills

func parse_skills() -> Dictionary:
    var result : Dictionary = {}

    var file : File = File.new()
    var file_result = file.open("res://resources/skills.json", File.READ)
    if file_result != OK:
        push_error("Could not open res://resources/skills.json")
        return result

    var jsonResult = JSON.parse(file.get_as_text())
    if typeof(jsonResult.result) == TYPE_DICTIONARY:
        var parsed_skills = jsonResult.result["skills"] as Array
        for parsed_skill in parsed_skills:
            var skill : Skill = Skill.new(
                    parsed_skill.name, parsed_skill.type, 
                    parsed_skill.cost, parsed_skill.crit_chance, 
                    parsed_skill.helpful_to_target, parsed_skill.modifier, 
                    parsed_skill.num_range, parsed_skill.possible_targets)
            result[skill.skill_name()] = skill
    else:
        push_error("could not parse res://resources/skills.json")
    return result
