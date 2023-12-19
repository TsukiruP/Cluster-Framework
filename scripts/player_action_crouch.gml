/// player_action_crouch()
// Eyes on the ground.

// Trigger crouch:
if(ground == true && x_speed == 0 && y_speed == 0 && (action_state == ACTION_DEFAULT || action_state == ACTION_GLIDE_DROP) && player_input[INP_DOWN, CHECK_HELD] == true) {
    if(animation_current != "look" && animation_current != "crouch") {
            action_state = ACTION_CROUCH;
            x_speed      = 0;
        }
}

// Crouch:
if(action_state == ACTION_CROUCH) {
    // Cancel crouch:
    if(ground == false || x_speed != 0 || y_speed != 0) action_state = ACTION_DEFAULT;

    if(ground == true && player_input[INP_DOWN, CHECK_HELD] == false) {
        if(animation_current_frame >= animation_flag_frame) {
            action_state = ACTION_DEFAULT;

            // Play animation:
            player_reverse_animation("stand");
        }
    }
}
