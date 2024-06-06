/// player_action_roll(phase)
// Keep rollin', rollin', rollin', rollin'

switch (argument0) {
    // Start:
    case ACTION_START:
        // Animation:
        player_set_animation("roll");
        break;

    // Step:
    case ACTION_STEP:
        // Input:
        if (input_x_direction != 0) {
            if (input_lock_alarm == 0) {
                if (g_speed != 0 && sign(g_speed) != input_x_direction) {
                    g_speed += roll_deceleration * input_x_direction;

                    if (sign(g_speed) == input_x_direction) {
                        g_speed = roll_deceleration * input_x_direction;
                    }
                }
            }
        }

        // Friction:
        g_speed -= min(abs(g_speed), roll_friction) * sign(g_speed);

        // Collision steps:
        player_collision_steps();

        // Changed:
        if (action_changed == true) {
            return false;
        }

        // Air:
        if (ground == false) {
            return player_set_action(player_action_air);
        }

        // Slope friction:
        if (ground_angle < 135 || ground_angle > 225) {
            // Rolling upwards:
            if (sign(g_speed) == sign(dsin(ground_angle))) g_speed -= dsin(ground_angle) * roll_friction_up;

            // Rolling downwards:
            else g_speed -= dsin(ground_angle) * roll_friction_down;
        }

        // Fall down slopes:
        if (mode != 0 && abs(g_speed) < 2.5) {
            if (ground_angle >= 90 && ground_angle <= 270) {
                return player_set_action(player_action_air);
            }
        }

        // Jump:
        if (touching_ceiling == false && input_player[INP_JUMP, CHECK_PRESSED] == true) {
            return player_set_action(player_action_jump);
        }

        // Uncurl:
        if (mode == 0 && abs(g_speed) < 0.5) {
            return player_set_action(player_action_run);
        }
        break;

    // Finish:
    case ACTION_FINISH:
        break;
}
