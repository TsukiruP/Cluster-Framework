/// player_set_state(state, [start])
// Sets the target state to be loaded next frame while finishing the current state.
// If given [start], the current state will always reset, but will decide if the state's start funciton will execute.

var state_reset, state_start;

state_reset = false;
state_start = true;

// Reset:
if (argument_count >= 2)
{
    state_reset = true;
    state_start = argument[1];
}

// Set state:
if (state_target != argument0 || state_reset == true)
{
    state_previous = state_current;
    state_target   = argument0;
    state_changed  = true;
    
    // Finish previous state:
    if (script_exists(state_previous))
    {
        script_execute(state_previous, STATE_FINISH);
    }
    
    // Start target state:
    if (state_start == true)
    {
        if (script_exists(state_target))
        {
            script_execute(state_target, STATE_START);
        }
    }
    
    // Success:
    return true;
}

// Failure:
return false;
