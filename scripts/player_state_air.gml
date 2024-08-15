/// player_state_air(phase)
// Falling with style.

switch (argument0) {
    // Start:
    case STATE_START:
        // Reset ground:
        if (on_ground == true) {
            on_ground = false;
        }

        var g_speed;

        // Set speed:
        g_speed =  x_speed;
        x_speed =  dcos(relative_angle) * g_speed;
        y_speed = -(dsin(relative_angle) * g_speed);

        // Reset air:
        player_reset_air();
        break;

    // Step:
    case STATE_STEP:
        // Input:
        if (input_x_direction != 0) {
            if (jump_state == true) {
                if (abs(x_speed) < top_speed) {
                    x_speed += (2 * acceleration) * input_x_direction;

                    if (abs(x_speed) > top_speed) {
                        x_speed = top_speed * input_x_direction;
                    }
                }
            } else if (spring_alarm == 0) {
                // Set direction:
                image_xscale = input_x_direction;

                if (abs(x_speed) < top_speed || sign(x_speed) != input_x_direction) {
                    x_speed += (2 * acceleration) * input_x_direction;

                    if (abs(x_speed) > top_speed && sign(x_speed) == input_x_direction) {
                        x_speed = top_speed * input_x_direction;
                    }
                }
            }
        }

        // Movement:
        if (!player_movement_air()) {
            exit;
        }

        // Changed:
        if (state_changed == true) {
            return false;
        }

        // Land:
        if (on_ground == true) {
            if (x_speed == 0) {
                return player_set_state(player_state_idle);
            } else {
                return player_set_state(player_state_run);
            }
        }

        // Variable jump:
        if (jump_state == true) {
            if (jump_special == false) {
                if (y_speed < jump_release && input_player[INP_JUMP, CHECK_HELD] == false) {
                    y_speed = jump_release;
                }
            }
        }

        // Spring behavior:
        else {
            if (spring_alarm > 0) {
                return false;
            }
        }

        // Air friction:
        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0) {
            x_speed *= air_friction;
        }

        // Gravity:
        if (y_allow == true) {
            y_speed += gravity_force;
        }

        // Jump direction:
        if (jump_state == true) {
            if (input_x_direction != 0 && image_xscale == -input_x_direction) {
                image_xscale = input_x_direction;
            }
        }

        // Jump Action:

        // Auxiliary Action:
        break;

    // Finish:
    case STATE_FINISH:
        // Reset jump:
        jump_state = false;

        // Reset spring:
        spring_strength = 0;
        spring_angle    = 0;
        spring_alarm    = 0;
        spring_current  = noone;
        break;
}
