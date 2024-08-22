/// player_set_state(state, [start])

var state_reset;

state_reset = false;
state_start = true;

// Reset:
if (argument_count >= 2) {
    state_reset = true;
    state_start = argument[1];
}

// Set state:
if (state_target != argument0 || state_reset == true) {
    state_previous = state_current;
    state_target   = argument0;
    state_changed  = true;

    // Finish previous state:
    if (script_exists(state_previous)) {
        script_execute(state_previous, STATE_FINISH);
    }

    // Success:
    return true;
}

// Failure:
return false;
