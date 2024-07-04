/// player_action_skid(phase)
// Try to outrun this demon to get left in the dust.

switch (argument0) {
    // Start:
    case ACTION_START:
        // Set animation:
        if (abs(g_speed) >= 5.50) {
            player_set_animation("skid_fast");
        } else {
            player_set_animation("skid");
        }

        // Set direction:
        if ((global.advance_skid == false || character_data == CHAR_CLASSIC) && g_speed != 0) {
            image_xscale = sign(g_speed);
        }

        // Play sound:
        sound_play_single("snd_skid");

        // Dust alarm:
        skid_dust_alarm = 3;
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
                        if (global.advance_turn == true && character_data != CHAR_CLASSIC && image_xscale != sign(g_speed)) {
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
            if (global.advance_skid == true && character_data != CHAR_CLASSIC) {
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

        // Dust:
        if (g_speed != 0) {
            if (skid_dust_alarm > 0) {
                skid_dust_alarm -= 1;

                if (skid_dust_alarm == 0) {
                    effect_create(ctl_skid, x, y + main_bottom, depth);
                    skid_dust_alarm = 3;
                }
            }
        }
        break;

    // Finish:
    case ACTION_FINISH:
        break;
}
