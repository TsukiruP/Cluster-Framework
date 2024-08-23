/// sonic_state_skid(phase)
// Sliiiide to the left, sliiiide to the right. Criss cross!

switch (argument0) {
    // Start:
    case STATE_START:
        // Set speed:
        x_speed = 3 * image_xscale;
        break;

    // Step:
    case STATE_STEP:
        // Air movement:
        if (on_ground == false) {
            if (!player_movement_air()) {
                exit;
            }

            // Land;
            if (on_ground == true) {
                if (x_speed == 0) {
                    return player_set_state(player_state_idle);
                } else {
                    return player_set_state(player_state_run);
                }
            }

            // Gravity:
            if (y_allow == true) {
                y_speed += gravity_force;
            }
        }

        // Ground movement:
        else {
            // Friction:
            if (animation_current == "skid") {
                x_speed -= min(abs(x_speed), 0.125) * sign(x_speed);
            } else {
                x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);
            }

            // Movement:
            if (!player_movement_ground()) {
                exit;
            }

            // Slide off:
            if (abs(x_speed) < slide_threshold && relative_angle >= 45 && relative_angle <= 315) {
                // Fall:
                if (relative_angle >= 90 && relative_angle <= 270) {
                    return player_set_state(player_state_air);
                }
            }

            // Finish animation:
            if (animation_finished == true) {
                switch (animation_current) {
                    // Skid:
                    case "somersault":
                        x_speed = 4 * image_xscale;
                        player_set_animation("skid");
                        break;

                    // Idle:
                    case "skid_end":
                        return player_set_state(player_state_idle);
                        break;
                }
            }
        }

        // Fall:
        if (on_ground == false) {
            // Reset air:
            if (ground_id != noone) {
                player_reset_air();
            }

            // Jump:
            if (animation_finished == true) {
                player_set_state(player_state_air, false);
                jump_state     = true;
                animation_skip = true;
                return true;
            }
        }

        // Skid behavior:
        if (animation_current == "skid") {
            // Cancel:
            if (on_ground == true) {
                // Cancel:
                if (input_player[INP_AUX, CHECK_PRESSED] == true) {
                    if (x_speed == 0) {
                        return player_set_state(player_state_idle);
                    } else {
                        return player_set_state(player_state_run);
                    }
                }

                // Dust:
                player_routine_dust();
            }

            if (animation_timer >= 32) {
                // Get up:
                if (on_ground == true) {
                    player_set_animation("skid_end");
                }

                // Jump:
                else {
                    player_reset_air();
                    player_set_state(player_state_air, false);
                    jump_state     = true;
                    animation_skip = true;
                    return true;
                }
            }
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
