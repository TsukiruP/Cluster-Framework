/// player_action_jump(phase)
// A jump to the sky turns to a rider kick.

switch (argument0) {
    // Start:
    case ACTION_START:
        // Set ground:
        if (ground == true) {
            ground = false;
        }

        // Set speed:
        x_speed -= dsin(ground_angle) * jump_force;
        y_speed -= dcos(ground_angle) * jump_force;
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

        // Jump skill:

        // Special skill:

        // Release:
        if (jump_complete == false && y_speed < jump_release && input_player[INP_JUMP, CHECK_HELD] == false) {
            y_speed = jump_release;
        }

        // Air drag:
        if (abs(x_speed) > 0.125 && y_speed > -4 && y_speed < 0) {
            x_speed *= 0.96875;
        }

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
        score_multiplier = 0;
        break;
}
