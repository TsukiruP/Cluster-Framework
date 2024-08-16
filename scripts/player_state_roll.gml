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

        // Slide off:
        if (abs(x_speed) < slide_threshold && relative_angle >= 45 && relative_angle <= 315) {
            // Fall:
            if (relative_angle >= 90 && relative_angle <= 270) {
                return player_set_state(player_state_air);
            }
        }

        // Slope friction:
        if (relative_angle < 135 || relative_angle > 225) {
            // Roll upwards:
            if (sign(x_speed) == sign(dsin(relative_angle))) {
                x_speed -= roll_friction_up * dsin(relative_angle);
            } else {
                x_speed -= roll_friction_down * dsin(relative_angle);
            }
        }

        // Jump:
        if (player_routine_jump()) {
            return true;
        }

        // Uncurl:
        if (abs(x_speed) < 0.5 && mask_rotation == gravity_angle()) {
            return player_set_state(player_state_run);
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
