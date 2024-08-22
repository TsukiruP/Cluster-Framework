/// sonic_state_skid(phase)
// Sliiiide to the left, sliiiide to the right. Criss cross!

switch (argument0) {
    // Start:
    case STATE_START:
        // Set speed:
        x_speed = 3 * image_xscale;

        // Skid alarm:
        skid_alarm = 32;
        break;

    // Step:
    case STATE_STEP:
        // Friction:
        if (on_ground == true) {
            if (animation_current == "skid") {
                x_speed -= min(abs(x_speed), 0.125) * sign(x_speed);
            } else {
                x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);
            }
        }

        // Movement:
        if (on_ground == false && animation_current == "skid") {
            if (!player_movement_air()) {
                exit;
            }
        } else {
            if (!player_movement_ground()) {
                exit;
            }
        }

        // Fall:
        if (on_ground == false && animation_current != "skid") {
            jump_state     = true;
            animation_skip = true;
            player_reset_air();
            return player_set_state(player_state_air, false);
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

        // Skid behavior:
        if (animation_current == "skid") {
            // Skid alarm:
            if (skid_alarm > 0) {
                skid_alarm -= 1;

                if (skid_alarm == 0) {
                    // Get up:
                    if (on_ground == true) {
                        player_set_animation("skid_end");
                    }

                    // Jump:
                    else {
                        jump_state     = true;
                        animation_skip = true;
                        return player_set_state(player_state_air, false);
                    }
                }
            }

            // Reset air:
            if (on_ground == false && ground_id != noone) {
                player_reset_air();
            }

            // Gravity:
            if (on_ground == false) {
                if (y_allow == true) {
                    y_speed += gravity_force;
                }
            }
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
