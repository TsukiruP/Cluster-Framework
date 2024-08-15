/// player_state_idle(phase)
// Standing here, I realize...

switch (argument0) {
    // Start:
    case STATE_START:
        break;

    // Step:
    case STATE_STEP:
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

        // Turn:
        // [PLACEHOLDER]

        // Run:
        if (x_speed != 0 || input_x_direction != 0) {
            return player_set_state(player_state_run);
        }

        // Jump:
        if (player_routine_jump()) {
            return true;
        }

        /*
        // Collision steps:
        player_collision_steps();

        if (!player_movement_ground()) {
            exit;
        }

        // Changed:
        if (state_changed == true || hint_wanted == true) {
            return false;
        }

        // Air:
        if (ground == false || (angle >= 90 && angle <= 270)) {
            //return player_set_state(player_state_air);
        }

        // Turn:
        if (global.advance_turn == false && character_id != CHAR_CLASSIC && image_xscale == -input_x_direction) {
            return player_set_state(player_state_turn);
        }

        // Lock:
        if (mode != 0) {
            input_lock_alarm = 30;
            return player_set_state(player_state_run);
        }

        // Run:
        if (g_speed != 0 || input_x_direction != 0) {
            return player_set_state(player_state_run);
        }

        // Slope friction:
        if (angle < 135 || angle > 225) {
            if (abs(g_speed) > 0.125 || input_lock_alarm != 0) {
                g_speed -= 0.125 * dsin(angle);
            }
        }

        // Jump:
        if (ground == true && touching_ceiling == false && input_player[INP_JUMP, CHECK_PRESSED] == true) {
            sound_play_single("snd_jump");
            //return player_set_state(player_state_jump);
        }

        // Balance:

        var edge_left, edge_right;

        edge_left  = (!player_terrain_line(main_right_rel, main_bottom + 16, true));
        edge_right = (!player_terrain_line(-main_left_rel, main_bottom + 16, true));

        if (mode == 0) {
            balance_direction = (edge_left - edge_right);
        } else {
            balance_direction = 0;
        }

        if (balance_direction == 0) {
            // Look & crouch:
            switch (input_y_direction) {
                // Look:
                case -1:
                    if (animation_current != "look") {
                        return player_set_state(player_state_look);
                    }
                    break;

                // Crouch:
                case 1:
                    if (animation_current != "crouch") {
                        return player_set_state(player_state_crouch);
                    }
                    break;
            }
        }
        */
        break;

    // Finish:
    case STATE_FINISH:
        // Reset balance:
        if (balance_direction != 0) {
            balance_direction = 0;
        }
        break;
}
