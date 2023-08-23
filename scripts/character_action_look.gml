/// character_action_look()
// Eyes on the sky.

// Trigger look:
if(ground == true && x_speed == 0 && y_speed == 0 && action_state == ACTION_DEFAULT && input_up == true) {
    if(animation_current != "look_end" && animation_current != "crouch" && animation_current != "crouch_end" &&
        animation_current != "tag_look_end" && animation_current != "tag_crouch" && animation_current != "tag_crouch_end") {
            action_state = ACTION_LOOK;
            x_speed      = 0;
        }
}

// Look:
if(action_state == ACTION_LOOK) {
    // Stop x speed:
    x_speed = 0;

    // Cancel look:
    if(ground == false || x_speed != 0 || y_speed != 0) {
        action_state = ACTION_DEFAULT;

        if(x_speed != 0) x_speed = 0;
    }

    if(ground == true && input_up == false) {
        if(animation_current_frame >= animation_loop_frame) {
            action_state = ACTION_DEFAULT;

            if(tag_hold_state == 3) animation_current = "tag_look_end";
            else animation_current = "look_end";
        }
    }
}
