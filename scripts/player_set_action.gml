/// player_set_action(action, [reset])

var action_reset;

// Set reset:
if (argument_count >= 2) {
    action_reset = argument[1];
} else {
    action_reset = false;
}

if (action_current != argument[0] || action_reset == true) {
    action_previous = action_current;
    action_current  = argument[0];
    action_changed  = true;

    // Finish previous action:
    if (script_exists(action_previous)) {
        script_execute(action_previous, ACTION_FINISH);
    }

    // Start current action:
    if (script_exists(action_current)) {
        script_execute(action_current, ACTION_START);
    }
}
