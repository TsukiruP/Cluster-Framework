/// player_state_air(phase)
// A jump to the sky turns to a rider kick.

switch (argument0) {
    // Start:
    case STATE_START:
        var g_speed, air_force;

        // Set speed:
        g_speed =  x_speed;
        x_speed =  dcos(relative_angle) * g_speed;
        y_speed = -(dsin(relative_angle) * g_speed);

        // Air force:
        air_force = jump_force;

        if (bound_state == 1) {
            air_force = 7.5;
        }

        // Jump:
        if (jump_state == true) {
            x_speed -= air_force * dsin(relative_angle);
            y_speed -= air_force * dcos(relative_angle);
        }

        // Reset shield:
        if (on_ground == true && status_shield_allow != true) {
            status_shield_allow = true;
        }

        // Splash:
        player_effect_splash();

        // Reset air:
        player_reset_air();
        break;

    // Step:
    case STATE_STEP:
        if (spring_alarm == 0) {
            // Input:
            switch (input_x_direction) {
                // Left:
                case -1:
                    if (x_speed > -top_speed) {
                        x_speed -= air_acceleration;
                    }
                    break;

                // Right:
                case 1:
                    if (x_speed < top_speed) {
                        x_speed += air_acceleration;
                    }
                    break;
            }

            // Direction:
            if (input_x_direction != 0) {
                image_xscale = input_x_direction;
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

        // Variable jump:
        if (jump_state == true) {
            var input_held;

            input_held = input_player[INP_JUMP, CHECK_HELD];

            if (jump_aux == true) {
                input_held = input_player[INP_AUX, CHECK_HELD];
            }

            if (y_speed < jump_release && input_held == false) {
                y_speed = jump_release;
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

        // Skill:
        if (player_routine_skill()) {
            return true;
        }
        break;

    // Finish:
    case STATE_FINISH:
        // Reset jump:
        jump_state = false;
        jump_aux   = false;

        // Reset bound:
        if (state_target != player_state_bound) {
            bound_state = 0;
        }

        // Reset spring:
        spring_strength = 0;
        spring_angle    = 0;
        spring_alarm    = 0;
        spring_current  = noone;
        break;
}
