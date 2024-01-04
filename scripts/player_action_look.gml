/// player_action_look()
// Eyes on the sky.

// Trigger look:
if(ground == true && g_speed == 0 && y_speed == 0 && action_state == ACTION_DEFAULT && player_input[INP_UP, CHECK_HELD] == true) {
    if(animation_current != "look" && animation_current != "crouch") {
            action_state = ACTION_LOOK;
            x_speed      = 0;
        }
}

// Look:
if(action_state == ACTION_LOOK) {
    // Cancel look:
    if(ground == false || g_speed != 0 || y_speed != 0) action_state = ACTION_DEFAULT;

    if(ground == true && player_input[INP_UP, CHECK_HELD] == false) {
        if(animation_current_frame >= animation_flag_frame) {
            action_state = ACTION_DEFAULT;

            // Play animation:
            player_reverse_animation("stand", 2.5);
        }
    }
}
