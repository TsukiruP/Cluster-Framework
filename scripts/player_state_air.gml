/// player_state_air(phase)
// Falling with style.

switch (argument0) {
    // Start:
    case ACTION_START:
        break;

    // Step:
    case ACTION_STEP:
        // Input:
        if (input_x_direction != 0 && spring_alarm == 0) {
            if (abs(x_speed) < top_speed || sign(x_speed) != input_x_direction) {
                x_speed += (2 * acceleration) * input_x_direction;

                if (abs(x_speed) > top_speed && sign(x_speed) == input_x_direction) {
                    x_speed = top_speed * input_x_direction;
                }
            }
        }

        // Collision steps:
        player_collision_steps();

        // Changed:
        if (state_changed == true) {
            return false;
        }

        // Land:
        if (ground == true) {
            if (x_speed == 0) {
                return player_set_state(player_state_idle);
            } else {
                return player_set_state(player_state_run);
            }
        }

        // Ignore physics and inputs if the alarm is still active:
        if (spring_alarm > 0) {
            return false;
        }

        // Air drag:
        if (abs(x_speed) > 0.125 && y_speed > -4 && y_speed < 0) {
            x_speed *= 0.96875;
        }

        // Gravity:
        if (y_allow == true) {
            y_speed += gravity_force;
        }

        // Set direction:
        if (input_x_direction != 0 && image_xscale == -input_x_direction) {
            image_xscale = input_x_direction;
        }
        break;

    // Finish:
    case ACTION_FINISH:
        // Reset spring:
        spring_strength = 0;
        spring_angle    = 0;
        spring_alarm    = 0;
        spring_current  = noone;
        break;
}
