/// player_action_look()
// Eyes on the sky.

// Look:
if (action_state == ACTION_LOOK) {
    // Cancel look:
    if (ground == false || g_speed != 0 || y_speed != 0) action_state = ACTION_DEFAULT;

    if (ground == true && animation_trigger == true && player_input[INP_UP, CHECK_HELD] == false) {
        action_state = ACTION_DEFAULT;
    }
}

// Trigger look:
if (ground == true && g_speed == 0 && y_speed == 0 && balance_direction == 0 && action_state == ACTION_DEFAULT && player_input[INP_UP, CHECK_HELD] == true) {
    if (animation_current != "look" && animation_current != "crouch") {
        action_state = ACTION_LOOK;
        g_speed      = 0;
    }
}
