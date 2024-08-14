/// player_react(obj, [side])
// Executes the reaction script of the given instance.

// Abort:
if (!script_exists(argument0.reaction_script)) {
    return false;
}

// Execute reaction:
