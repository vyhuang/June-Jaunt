extends Reference

class_name Skill

# Can be 'health' or 'status'
var type : String

# Can be '0.00, .10, or 0.15'
var crit_chance : float

var helpful_to_target : bool

# Can be '+/-<status_effect>' or '+/-<numeric_value>'
var modifier : String
