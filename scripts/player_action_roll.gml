/// player_action_roll()
// Keep rollin', rollin', rollin', rollin'

// Trigger roll:
if(ground == true && action_state == ACTION_DEFAULT && abs(x_speed) >= 1.03125 && tag_animations == false &&
    player_input[INP_LEFT, CHECK_HELD] == false && player_input[INP_RIGHT, CHECK_HELD] == false && player_input[INP_DOWN, CHECK_HELD] == true) {
    action_state = ACTION_ROLL;

    // Play sound:
    sound_play_single("snd_roll");
}


// Roll:
if(action_state == ACTION_ROLL) {
    if(ground == true) {
        // Deceleration:
        if(input_lock_alarm == 0) {
            if(x_speed > 0 && player_input[INP_LEFT, CHECK_HELD] == true) x_speed = max(x_speed - roll_deceleration, 0);

            if(x_speed < 0 && player_input[INP_RIGHT, CHECK_HELD] == true) x_speed = min(x_speed + roll_deceleration, 0);
        }

        // Friction:
        x_speed -= min(abs(x_speed), roll_friction) * sign(x_speed);

        // Uncurl:
        if(((player_input[INP_LEFT, CHECK_HELD] == false && player_input[INP_RIGHT, CHECK_HELD] == false && player_input[INP_UP, CHECK_HELD] == true) || abs(x_speed) < 0.5) && tunnel_lock == false) {
            action_state = ACTION_DEFAULT;
        }
    } else {
        action_state  = ACTION_JUMP;
        jump_complete = true;
        roll_rebounce = true;
    }
}
