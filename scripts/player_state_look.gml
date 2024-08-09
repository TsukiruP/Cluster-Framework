/// player_state_look(phase)
// Eyes on the sky.

switch (argument0) {
    // Start:
    case STATE_START:
        break;

    // Step:
    case STATE_STEP:
        // Collision steps:
        player_collision_steps();

        // Changed:
        if (state_changed == true) {
            return false;
        }

        // Air:
        if (ground == false || (ground_angle >= 90 && ground_angle <= 270)) {
            return player_set_state(player_state_air);
        }

        // Lock:
        if (mode != 0) {
            input_lock_alarm = 30;
            return player_set_state(player_state_run);
        }

        // Slope friction:
        if (ground_angle < 135 || ground_angle > 225) {
            if (abs(g_speed) > 0.125 || input_lock_alarm != 0) {
                g_speed -= 0.125 * dsin(ground_angle);
            }
        }

        // Jump:
        if (touching_ceiling == false && input_player[INP_JUMP, CHECK_PRESSED] == true) {
            sound_play_single("snd_jump");
            return player_set_state(player_state_jump);
        }

        // Run:
        if (g_speed != 0) {
            return player_set_state(player_state_run);
        }

        // Idle:
        if (animation_trigger == true && input_player[INP_UP, CHECK_HELD] == false) {
            animation_reverse = true;
            return player_set_state(player_state_idle);
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
