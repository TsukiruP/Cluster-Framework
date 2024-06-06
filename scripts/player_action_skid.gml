/// player_action_skid(phase)
// Try to outrun this demon to get left in the dust.

switch (argument0) {
    // Start:
    case ACTION_START:
        // Animation:
        if (abs(g_speed) >= top_speed) {
            player_set_animation("skid_fast");
        } else {
            player_set_animation("skid");
        }
        break;

    // Step:
    case ACTION_STEP:
        // Input:
        if (input_x_direction != 0) {
            if (sign(g_speed) != input_x_direction) {
                if (input_lock_alarm == 0) {
                    g_speed += deceleration * input_x_direction;

                    if (sign(g_speed) == input_x_direction) {
                        g_speed = deceleration * input_x_direction;

                        // Turn:
                        if (global.gameplay_turn == true) {
                            player_set_animation("turn_skid");
                            return player_set_action(player_action_turn);
                        }

                        // Run:
                        else {
                            return player_set_action(player_action_run);
                        }
                    }
                }
            } else {
                return player_set_action(player_action_run);
            }
        }

        // Friction:
        else {
            // Run:
            if (global.gameplay_skid == true) {
                return player_set_action(player_action_run);
            }

            g_speed -= min(abs(g_speed), acceleration) * sign(g_speed);

            // Roll:
            if (abs(g_speed) > 1) {
                if (input_player[INP_DOWN, CHECK_HELD] == true) {
                    return player_set_action(player_action_roll);
                }
            }

            else {
                switch (input_y_direction) {
                    // Look:
                    case -1:
                        return player_set_action(player_action_look);
                        break;

                    // Crouch:
                    case 1:
                        return player_set_action(player_action_crouch);
                        break;
                }
            }
        }

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
            if (abs(g_speed) > 0.125 || input_lock_alarm != 0) g_speed -= dsin(ground_angle) * 0.125;
        }

        // Fall down slopes:
        if (mode != 0 && abs(g_speed) < 2.5) {
            if (ground_angle >= 90 && ground_angle <= 270) {
                return player_set_action(player_action_air);
            } else {
                input_lock_alarm = 30;
            }
        }

        // Jump:
        if (touching_ceiling == false && input_player[INP_JUMP, CHECK_PRESSED] == true) {
            return player_set_action(player_action_jump);
        }

        // Idle:
        if (g_speed == 0 && input_x_direction == 0) {
            return player_set_action(player_action_idle);
        }

        // Dust:
        break;

    // Finish:
    case ACTION_FINISH:
        break;
}
