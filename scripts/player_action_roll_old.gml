/// player_action_roll()
// Keep rollin', rollin', rollin', rollin'

// Roll:
if (action_state == ACTION_ROLL) {
    if (ground == true) {
        // Deceleration:
        if (input_lock_alarm == 0) {
            if (g_speed > 0 && input_player[INP_LEFT, CHECK_HELD] == true) g_speed = max(g_speed - roll_deceleration, 0);

            if (g_speed < 0 && input_player[INP_RIGHT, CHECK_HELD] == true) g_speed = min(g_speed + roll_deceleration, 0);
        }

        // Friction:
        g_speed -= min(abs(g_speed), roll_friction) * sign(g_speed);

        // Uncurl:
        if (((input_player[INP_LEFT, CHECK_HELD] == false && input_player[INP_RIGHT, CHECK_HELD] == false && input_player[INP_UP, CHECK_HELD] == true) || abs(g_speed) < 0.5) && tunnel_lock == false) {
            action_state = ACTION_DEFAULT;
        }
    } else {
        action_state  = ACTION_JUMP;
        jump_complete = true;
        roll_rebounce = true;
    }
}

// Trigger roll:
if (ground == true && action_state == ACTION_DEFAULT && abs(g_speed) >= 1.03125 && tag_animations == false &&
    input_player[INP_LEFT, CHECK_HELD] == false && input_player[INP_RIGHT, CHECK_HELD] == false && input_player[INP_DOWN, CHECK_HELD] == true) {
    action_state = ACTION_ROLL;

    // Play sound:
    sound_play_single("snd_roll");
}
