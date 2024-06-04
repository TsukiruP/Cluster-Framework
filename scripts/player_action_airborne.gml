/// player_action_airborne(phase)

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
        if (input_direction != 0) {
            if (abs(x_speed) < top_speed) {
                x_speed += (2 * acceleration) * input_direction;

                if (abs(x_speed) > top_speed) {
                    x_speed = top_speed * input_direction;
                }
            }
        }

        // Collision steps:
        player_collision_steps();

        // Exit:
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
        if (input_direction != 0 && animation_direction == -input_direction) {
            animation_direction = input_direction;
        }
        break;

    // Finish:
    case ACTION_FINISH:
        break;
}
