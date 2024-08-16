/// player_set_state(state, [reset])

var state_reset;

// Initialize:
state_reset = false;

// Reset:
if (argument_count >= 2) {
    state_reset = argument[1];
}

// Set state:
if (state_current != argument0 || state_reset == true) {
    state_previous = state_current;
    state_current  = argument0;
    state_changed  = true;

    // Finish previous state:
    if (script_exists(state_previous)) {
        script_execute(state_previous, STATE_FINISH);
    }

    // Start current state:
    if (script_exists(state_current)) {
        script_execute(state_current, STATE_START);
    }

    // Success:
    return true;
}

// Failure:
return false;
