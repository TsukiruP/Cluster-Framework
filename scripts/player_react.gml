/// player_react(obj, collision, [side])
// Executes the reaction script of the given instance.

// Abort:
if (!script_exists(argument0.reaction_index)) {
    return false;
}

// Execute reaction:
if (argument_count < 3) {
    return script_execute(argument0.reaction_index, argument0, argument1);
}

return script_execute(argument0.reaction_index, argument0, argument1, argument[2]);
