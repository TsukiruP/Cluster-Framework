/// player_set_state(state, [start])
/// @desc Sets the player's next state.
/// @param {script} state
/// @param {bool} [start]
/// @returns {bool}

var _state; _state = argument[0];
var _start; if (argument_count > 1) _start = argument[1]; else _start = true;

var state_reset; state_reset = (argument_count > 1);

if (state_current != argument0 || state_reset)
{
    state_previous = state_current;
    state_current = argument0;
    state_changed = true;
    
    if (script_exists(state_previous)) script_execute(state_previous, STATE_FINISH);
    if (_start)
    {
        if (script_exists(state_current)) script_execute(state_current, STATE_START);
    }
    
    return true;
}

return false;