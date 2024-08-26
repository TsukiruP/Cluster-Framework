/// player_state_brake(phase)
// Try to outrun this demon to get left in the dust.

switch (argument0) {
    // Start:
    case STATE_START:
        // Set animation:
        if (abs(x_speed) >= 6.00) {
            player_set_animation("brake_fast");
        } else {
            player_set_animation("brake");
        }

        // Set direction:
        if ((global.advance_brake == false || character_id == CHAR_CLASSIC) && x_speed != 0) {
            image_xscale = sign(x_speed);
        }
        break;

    // Step:
    case STATE_STEP:
        // Input:
        if (input_x_direction != 0) {
            if (sign(x_speed) != input_x_direction) {
                if (input_lock_alarm == 0) {
                    x_speed += deceleration * input_x_direction;

                    if (sign(x_speed) == input_x_direction) {
                        x_speed = deceleration * input_x_direction;

                        // Turn:
                        if (global.advance_turn == true && character_id != CHAR_CLASSIC && image_xscale != sign(x_speed)) {
                            player_set_animation("turn_brake");
                            return player_set_state(player_state_turn);
                        }

                        // Run:
                        else {
                            return player_set_state(player_state_run);
                        }
                    }
                }
            } else {
                return player_set_state(player_state_run);
            }
        }

        // Friction:
        else {
            // Run:
            if (global.advance_brake == true && character_id != CHAR_CLASSIC) {
                return player_set_state(player_state_run);
            }

            x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);

            // Roll:
            if (abs(x_speed) > 0.5) {
                if (input_player[INP_DOWN, CHECK_HELD] == true) {
                    // Play sound:
                    sound_play_single("snd_roll");

                    return player_set_state(player_state_roll);
                }
            }
        }

        // Movement:
        if (!player_movement_ground()) {
            exit;
        }

        // Fall:
        if (on_ground == false) {
            return player_set_state(player_state_air);
        }

        // Slide off:
        if (abs(x_speed) < slide_threshold && relative_angle >= 45 && relative_angle <= 315) {
            // Fall:
            if (relative_angle >= 90 && relative_angle <= 270) {
                return player_set_state(player_state_air);
            } else {
                input_lock_alarm = 30;

                return player_set_state(player_state_run);
            }
        }

        // Slope friction:
        player_slope_friction(slope_friction, acceleration);

        // Idle:
        if (x_speed == 0 && input_x_direction == 0) {
            return player_set_state(player_state_idle);
        }

        // Skill:
        if (player_routine_skill()) {
            return true;
        }

        // Jump:
        if (player_collision_ceiling(y_radius + 5) == noone && input_player[INP_JUMP, CHECK_PRESSED] == true) {
            // Play sound:
            sound_play_single("snd_jump");

            return player_set_state(player_state_jump);
        }

        // Dust:
        if (x_speed != 0) {
            player_effect_dust();
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
