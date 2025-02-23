/// player_set_state(state, [start])
/* Sets the target state to be loaded next frame while finishing the current state.
If given [start], the current state will always reset, but will decide if the state's start funciton will execute. */

var state_reset, state_start;

state_reset = false;
state_start = true;
if (argument_count > 1)
{
    state_reset = true;
    state_start = argument[1];
}

if (state_current != argument0 || state_reset)
{
    state_previous = state_current;
    state_current = argument0;
    state_changed = true;
    
    if (script_exists(state_previous)) script_execute(state_previous, STATE_FINISH);
    if (state_start)
    {
        if (script_exists(state_current)) script_execute(state_current, STATE_START);
    }
    
    return true;
}

return false;