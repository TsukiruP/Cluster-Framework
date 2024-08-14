/// player_state_run(phase)
//

switch (argument0) {
    // Start:
    case STATE_START:
        break;

    // Step:
    case STATE_STEP:

        // Input:
        if (input_x_direction != 0) {
            // Decelerate:
            if (x_speed != 0 && sign(x_speed) != input_x_direction) {
                if (input_lock_alarm == 0) {
                    // Turn:
                    if (global.advance_turn == false && abs(x_speed) <= 4 && image_xscale == -input_x_direction) {
                        //return player_set_state(player_state_turn);
                    }

                    // Skid:
                    if (abs(x_speed) > 4) {
                        //return player_set_state(player_state_skid);
                    }

                    x_speed += deceleration * input_x_direction;

                    if (sign(x_speed) == input_x_direction) {
                        x_speed = deceleration * input_x_direction;
                    }
                }
            }

            // Accelerate:
            else {
                // Set direction:
                image_xscale = input_x_direction;

                if (abs(x_speed) < top_speed) {
                    x_speed += acceleration * input_x_direction;

                    if (abs(x_speed) > top_speed) {
                        x_speed = top_speed * input_x_direction;
                    }
                }
            }
        }

        // Friction:
        else {

            x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);
            /*
            // Roll:
            if (abs(x_speed) > 0.5) {
                if (input_player[INP_DOWN, CHECK_HELD] == true) {
                    sound_play_single("snd_roll");
                    return player_set_state(player_state_roll);
                }
            }
            */
        }


        // Movement:
        if (!player_movement_ground()) {
            exit;
        }

        // Changed:
        if (state_changed == true) {
            return false;
        }

        // Fall:
        if (on_ground == false) {
            return player_set_state(player_state_air);
        }

        // Steep slants:
        // [PLACEHOLDER]

        // Slope friction:
        // [PLACEHOLDER]

        // Idle:
        if (x_speed == 0 && input_x_direction == 0) {
            return player_set_state(player_state_idle);
        }

        /*
        // Air:
        if (ground == false) {
            return player_set_state(player_state_air);
        }

        // Slope friction:
        if (ground_angle < 135 || ground_angle > 225) {
            if (abs(x_speed) > 0.125 || input_lock_alarm != 0) {
                x_speed -= 0.125 * dsin(ground_angle);
            }
        }

        // Fall down slopes:
        if (mode != 0 && abs(x_speed) < 2.5) {
            if (ground_angle >= 90 && ground_angle <= 270) {
                return player_set_state(player_state_air);
            } else {
                input_lock_alarm = 30;
            }
        }

        // Jump:
        if (touching_ceiling == false && input_player[INP_JUMP, CHECK_PRESSED] == true) {
            sound_play_single("snd_jump");
            return player_set_state(player_state_jump);
        }

        // Idle:
        if (x_speed == 0 && input_x_direction == 0) {
            return player_set_state(player_state_idle);
        }

        // Push:

        if (image_xscale == input_x_direction &&
            ((image_xscale == -1 && (player_terrain_point(-(wall_left + 1), wall_bottom)) || (image_xscale == 1 && player_terrain_point((wall_right + 1), wall_bottom))) && abs(x_speed) <= acceleration + 0.5) ||
            (player_obstacle_rectangle(wall_left + 1, main_top, main_right + 1, main_bottom) && abs(x_speed) <= acceleration)) {
                player_set_state(player_state_push);
            }
        */
        break;

    // Finish:
    case STATE_FINISH:
        input_lock_alarm = 0;
        break;
}
