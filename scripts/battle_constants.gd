extends Reference

class_name BattleConstants

enum BATTLE_STATE {
    IN_BATTLE, PAUSED, VICTORY, DEFEAT}

enum STATUS {
    # Cannot be healed or take any actions. If all units in one side of the 
    # battle are unconscious the battle ends.
    UNCONSCIOUS, 

    # Takes damage over for a set period of time. The amount of health
    # lost depends on the afflicted's stats.
    BLEEDING, 
    # Introduces chance of actions missing their intended target. Missed 
    # actions have a chance to hit another random target. Will wear off after 
    # a short amount of time.
    BLINDED, 
    # The next hit of damage taken will be multiplied by 1.5.
    EXPOSED,
    # Interrupts and prevents actions from being taken. Will wear off after a
    # short amount of time.
    STUNNED, 
    # Energy regen is halved. How long this status lasts depends on the
    # afflicted's stats.
    WEAKENED, 

    # Raises the critical chance of actions by one tier. Critical successes
    # for 'health' actions will apply a multiplier of 1.5. Critical successes
    # for 'status' actions will apply a multiplier of to the applied status' 
    # duration. Will also restore a set amount of energy based on the user's
    # stats.
    FOCUSED,
    # Nullifies the next negative action taken against the recipient. Removes
    # the 'EXPOSED' status, but all other status conditions remain.
    GUARDED,
    # Regenerates health for a set amount of time. How much health is 
    # regenerated depends on the recipient's stats.
    MENDING, 
    # Energy regen is multiplied by 1.75. How long this status lasts depends
    # on the recipient's stats.
    SPIRITED,
    # Removes all negative status effects and prevents any others from being
    # applied for a set amount of time.
    WARDED}
