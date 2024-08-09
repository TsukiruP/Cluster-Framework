/// player_state_turn(phase)
// Turn around, every now and then I get a little bit lonely...

switch (argument0) {
    // Start:
    case ACTION_START:
        // Reset speed:
        g_speed = 0;

        // Flip direction:
        image_xscale *= -1;
        break;

    // Step:
    case ACTION_STEP:
        // Collision steps:
        player_collision_steps();

        // Changed:
        if (state_changed == true) {
            return false;
        }

        // Air:
        if (ground == false) {
            return player_set_state(player_state_air);
        }

        // Slope friction:
        if (ground_angle < 135 || ground_angle > 225) {
            if (abs(g_speed) > 0.125 || input_lock_alarm != 0) {
                g_speed -= 0.125 * dsin(ground_angle);
            }
        }

        // Fall down slopes:
        if (mode != 0 && abs(g_speed) < 2.5) {
            if (ground_angle >= 90 && ground_angle <= 270) {
                return player_set_state(player_state_air);
            } else {
                input_lock_alarm = 30;
            }
        }

        // Jump:
        if (touching_ceiling == false && input_player[INP_JUMP, CHECK_PRESSED] == true) {
            sound_play_single("snd_jump");
            return player_set_state(player_state_jump);
        }

        // Idle:
        if (animation_finished == true) {
            player_set_state(player_state_idle);
        }
        break;

    // Finish:
    case ACTION_FINISH:
        break;
}
