/// player_action_roll()
// Keep rollin', rollin', rollin', rollin'

// Trigger roll:
if(ground == true && action_state == ACTION_DEFAULT && abs(x_speed) >= 1.03125 && input_left == false && input_right == false && input_down == true) {
    action_state = ACTION_ROLL;

    // Play sound:
    sound_play_single("snd_roll");
}


// Roll:
if(action_state == ACTION_ROLL) {
    if(ground == true) {
        // Deceleration:
        if(x_speed > 0 && input_left == true) x_speed = max(x_speed - roll_deceleration, 0);
        if(x_speed < 0 && input_right == true) x_speed = min(x_speed + roll_deceleration, 0);

        // Friction:
        x_speed -= min(abs(x_speed), roll_friction) * sign(x_speed);

        // Uncurl:
        if(((input_left == false && input_right == false && input_up == true) || abs(x_speed) < 0.5) && tunnel_lock == false) {
            action_state = ACTION_DEFAULT;
        }
    } else {
        jump_complete = true;
        action_state  = ACTION_JUMP;
    }
}
