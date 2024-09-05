/// player_state_air(phase)
// Falling with style.

switch (argument0) {
    // Start:
    case STATE_START:
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
        if (spring_alarm == 0) {
            // Input:
            if (input_x_direction != 0) {
                image_xscale = input_x_direction;

                if (abs(x_speed) < top_speed || sign(x_speed) != input_x_direction) {
                    x_speed += (acceleration * 2) * input_x_direction;

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

        // Land:
        if (player_routine_land()) {
            return true;
        }

        // Spring:
        if (spring_alarm > 0) {
            return false;
        }

        // Air friction:
        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0) {
            x_speed *= air_friction;
        }

        // Gravity:
        if (y_allow == true) {
            y_speed += gravity_force;
        }

        // Skill:
        if (player_routine_skill()) {
            return true;
        }
        break;

    // Finish:
    case STATE_FINISH:
        // Reset spring:
        spring_snap     = false;
        spring_strength = 0;
        spring_angle    = 0;
        spring_alarm    = 0;
        spring_current  = noone;
        break;

    // Animate:
    case STATE_ANIMATE:
        // Snap to spring:
        x = spring_current.x;

        if (spring_angle == ANGLE_LEFT || spring_angle == ANGLE_RIGHT) {
            y = spring_current.y;
        }
        break;
}
