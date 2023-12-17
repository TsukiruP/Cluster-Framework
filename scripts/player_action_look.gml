/// player_action_look()
// Eyes on the sky.

// Trigger look:
if(ground == true && x_speed == 0 && y_speed == 0 && action_state == ACTION_DEFAULT && player_input[INP_UP, CHECK_HELD] == true) {
    if(animation_current != "look_end" && animation_current != "crouch" && animation_current != "crouch_end") {
            action_state = ACTION_LOOK;
            x_speed      = 0;
        }
}

// Look:
if(action_state == ACTION_LOOK) {
    // Cancel look:
    if(ground == false || x_speed != 0 || y_speed != 0) action_state = ACTION_DEFAULT;

    if(ground == true && player_input[INP_UP, CHECK_HELD] == false) {
        if(animation_current_frame >= animation_loop_frame) {
            action_state = ACTION_DEFAULT;

            // Play animation:
            animation_target = "look_end";
        }
    }
}
