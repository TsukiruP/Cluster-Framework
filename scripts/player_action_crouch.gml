/// player_action_crouch()
// Eyes on the ground.

// Crouch:
if (action_state == ACTION_CROUCH) {
    // Cancel crouch:
    if (ground == false || g_speed != 0 || y_speed != 0) action_state = ACTION_DEFAULT;

    if (ground == true && animation_trigger == true && player_input[INP_DOWN, CHECK_HELD] == false) {
        action_state      = ACTION_DEFAULT;
        animation_reverse = true;
    }
}

// Trigger crouch:
if (ground == true && g_speed == 0 && y_speed == 0 && balance_direction == 0 && (action_state == ACTION_DEFAULT || action_state == ACTION_GLIDE_DROP) && player_input[INP_DOWN, CHECK_HELD] == true) {
    if (animation_current != "look" && animation_current != "crouch" && animation_current != "omochao") {
        action_state = ACTION_CROUCH;
        g_speed      = 0;
    }
}
