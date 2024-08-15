/// player_state_roll(phase)
// Keep rollin', rollin', rollin', rollin'

switch (argument0) {
    // Start:
    case STATE_START:
        // Set physics
        if (x_speed == 0) {
            x_speed = 2 * input_x_direction;
        }
        break;

    // Step:
    case STATE_STEP:
        // Input:
        if (input_x_direction != 0) {
            if (input_lock_alarm == 0) {
                if (x_speed != 0 && sign(x_speed) != input_x_direction) {
                    x_speed += roll_deceleration * input_x_direction;

                    if (sign(x_speed) == input_x_direction) {
                        x_speed = roll_deceleration * input_x_direction;
                    }
                }
            }
        }

        // Friction:
        x_speed -= min(abs(x_speed), roll_friction) * sign(x_speed);

        // Movement:
        if (!player_movement_ground()) {
            exit;
        }

        // Changed:
        if (state_changed == true) {
            return false;
        }

        // Fall:
        if (on_ground == false) {
            return player_set_state(player_state_air);
        }

        // Slope friction:
        if (ground_angle < 135 || ground_angle > 225) {
            // Rolling upwards:
            if (sign(x_speed) == sign(dsin(ground_angle))) {
                x_speed -= roll_friction_up * dsin(ground_angle);
            }

            // Rolling downwards:
            else {
                x_speed -= roll_friction_down * dsin(ground_angle);
            }
        }

        // Fall down slopes:
        if (mode != 0 && abs(x_speed) < 2.5) {
            if (ground_angle >= 90 && ground_angle <= 270) {
                return player_set_state(player_state_air);
            }
        }

        // Jump:
        if (touching_ceiling == false && input_player[INP_JUMP, CHECK_PRESSED] == true) {
            sound_play_single("snd_jump");
            return player_set_state(player_state_jump);
        }

        // Uncurl:
        if (mode == 0 && abs(x_speed) < 0.5) {
            return player_set_state(player_state_run);
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
