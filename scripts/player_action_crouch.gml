/// player_action_crouch()
// Eyes on the ground.

// Trigger crouch:
if(ground == true && x_speed == 0 && y_speed == 0 && (action_state == ACTION_DEFAULT || action_state == ACTION_GLIDE_DROP) && player_input[INP_DOWN, CHECK_HELD] == true) {
    if(animation_current != "look" && animation_current != "look_end" && animation_current != "crouch_end" &&
        animation_current != "tag_look" && animation_current != "tag_look_end" && animation_current != "tag_crouch_end" ) {
            action_state = ACTION_CROUCH;
            x_speed      = 0;
        }
}

// Crouch:
if(action_state == ACTION_CROUCH) {
    // Cancel crouch:
    if(ground == false || x_speed != 0 || y_speed != 0) action_state = ACTION_DEFAULT;

    if(ground == true && player_input[INP_DOWN, CHECK_HELD] == false) {
        if(animation_current_frame >= animation_loop_frame) {
            action_state = ACTION_DEFAULT;

            // Play animation:
            if(tag_hold_state == 3) animation_target = "tag_crouch_end";
            else animation_target = "crouch_end";
        }
    }
}
