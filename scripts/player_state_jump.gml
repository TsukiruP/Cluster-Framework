/// player_state_jump(phase)
// A jump to the sky turns to a rider kick.

switch (argument0) {
    // Start:
    case STATE_START:
        // Set ground:
        if (ground == true) {
            ground = false;
        }

        // Set speed:
        x_speed -= jump_force * dsin(ground_angle);
        y_speed -= jump_force * dcos(ground_angle);
        break;

    // Step:
    case STATE_STEP:
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
        if (state_changed == true) {
            return false;
        }

        // Land:
        if (ground == true) {
            if (x_speed == 0) {
                return player_set_state(player_state_idle);
            } else {
                return player_set_state(player_state_run);
            }
        }

        /*
        // Jump skill:
        if (input_player[INP_JUMP, CHECK_PRESSED] == true) {
            switch (character_id) {
                case CHAR_SONIC:
                    sonic_skill_list(SONIC_JUMP);
                    break;
            }
        }

        // Special skill:
        if (input_player[INP_SPECIAL, CHECK_PRESSED] == true) {
            switch (character_id) {
                case CHAR_SONIC:
                    sonic_skill_list(SONIC_SPECIAL_A);
                    break;
            }
        }
        */

        // Release:
        if (y_speed < jump_release && jump_special == false && input_player[INP_JUMP, CHECK_HELD] == false) {
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
    case STATE_FINISH:
        /*
        // Reset jump:
        if (jump_special != false) {
            jump_special = false;
        }

        // Reset shield:
        if (ground == true && status_shield_allow != true) {
            status_shield_allow = true;
        }

        // Reset insta invincibility:
        if (status_insta_alarm != 0) {
            status_insta_alarm = 0;
        }
        */
        break;
}
