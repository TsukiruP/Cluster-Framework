/// player_state_bound()
//

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

        // Jump:
        if (ground == true) {
            player_set_state(player_state_jump);

            x_speed     -= 7.5 * dsin(ground_angle);
            y_speed     -= 7.5 * dcos(ground_angle);
            jump_special = true;
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
        break;
}
