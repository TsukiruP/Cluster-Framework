/// player_action_air(phase)
//

switch (argument0) {
    // Start:
    case ACTION_START:
        if (ground == true) {
            ground = false;
        }
        break;

    // Step:
    case ACTION_STEP:
        // Input:
        if (input_x_direction != 0) {
            if (abs(x_speed) < top_speed) {
                x_speed += (2 * acceleration) * input_x_direction;

                if (abs(x_speed) > top_speed) {
                    x_speed = top_speed * input_x_direction;
                }
            }
        }

        // Collision steps:
        player_collision_steps();

        // Changed:
        if (action_changed == true) {
            return false;
        }

        // Land:
        if (ground == true) {
            if (x_speed == 0) {
                return player_set_action(player_action_idle);
            } else {
                return player_set_action(player_action_run);
            }
        }

        // Air drag:
        if (abs(x_speed) > 0.125 && y_speed > -4 && y_speed < 0) x_speed *= 0.96875;

        // Gravity:
        if (y_allow == true) {
            y_speed += gravity_force;
        }

        // Direction:
        if (input_x_direction != 0 && image_xscale == -input_x_direction) {
            image_xscale = input_x_direction;
        }
        break;

    // Finish:
    case ACTION_FINISH:
        break;
}
