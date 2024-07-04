/// player_action_run(phase)
//

switch (argument0) {
    // Start:
    case ACTION_START:
        break;

    // Step:
    case ACTION_STEP:
        // Input:
        if (input_x_direction != 0) {
            // Turn:
            if (global.advance_turn == true && abs(g_speed) <= 4 && image_xscale == -input_x_direction) {
                if (input_lock_alarm == 0) {
                    return player_set_action(player_action_turn);
                }
            }

            // Decelerate:
            else if (g_speed != 0 && sign(g_speed) != input_x_direction) {
                if (input_lock_alarm == 0) {
                    // Skid:
                    if (abs(g_speed) > 4) {
                        return player_set_action(player_action_skid);
                    }

                    g_speed += deceleration * input_x_direction;

                    if (sign(g_speed) == input_x_direction) {
                        g_speed = deceleration * input_x_direction;
                    }
                }
            }

            // Accelerate:
            else {
                if (abs(g_speed) < top_speed) {
                    g_speed += acceleration * input_x_direction;

                    if (abs(g_speed) > top_speed) {
                        g_speed = top_speed * input_x_direction;
                    }
                }

                // Set direction:
                image_xscale = input_x_direction;
            }
        }

        // Friction:
        else {
            g_speed -= min(abs(g_speed), acceleration) * sign(g_speed);

            // Roll:
            if (abs(g_speed) > 0.5) {
                if (input_player[INP_DOWN, CHECK_HELD] == true) {
                    sound_play_single("snd_roll");
                    return player_set_action(player_action_roll);
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
            if (abs(g_speed) > 0.125 || input_lock_alarm != 0) {
                g_speed -= dsin(ground_angle) * 0.125;
            }
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
            sound_play_single("snd_jump");
            return player_set_action(player_action_jump);
        }

        // Idle:
        if (g_speed == 0 && input_x_direction == 0) {
            return player_set_action(player_action_idle);
        }

        // Push:
        break;

    // Finish:
    case ACTION_FINISH:
        input_lock_alarm = 0;
        break;
}
