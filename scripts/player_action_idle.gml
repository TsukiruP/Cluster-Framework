/// player_action_idle(phase)
// Standing here, I realize...

switch (argument0) {
    // Start:
    case ACTION_START:
        // Land:
        if (ground == true && y_speed > 0) {
            player_set_animation("land");
        }
        break;

    // Step:
    case ACTION_STEP:
        // Collision steps:
        player_collision_steps();

        // Changed:
        if (action_changed == true || hint_wanted == true) {
            return false;
        }

        // Air:
        if (ground == false || (ground_angle >= 90 && ground_angle <= 270)) {
            return player_set_action(player_action_air);
        }

        // Turn:
        if (global.advance_turn == true && character_data != CHAR_CLASSIC && image_xscale == -input_x_direction) {
            return player_set_action(player_action_turn);
        }

        // Lock:
        if (mode != 0) {
            input_lock_alarm = 30;
            return player_set_action(player_action_run);
        }

        // Run:
        if (g_speed != 0 || input_x_direction != 0) {
            return player_set_action(player_action_run);
        }

        // Slope friction:
        if (ground_angle < 135 || ground_angle > 225) {
            if (abs(g_speed) > 0.125 || input_lock_alarm != 0) g_speed -= dsin(ground_angle) * 0.125;
        }

        // Jump:
        if (ground == true && touching_ceiling == false && input_player[INP_JUMP, CHECK_PRESSED] == true) {
            sound_play_single("snd_jump");
            return player_set_action(player_action_jump);
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
                        return player_set_action(player_action_look);
                    }
                    break;

                // Crouch:
                case 1:
                    if (animation_current != "crouch") {
                        return player_set_action(player_action_crouch);
                    }
                    break;
            }
        }
        break;

    // Finish:
    case ACTION_FINISH:
        // Reset balance:
        if (balance_direction != 0) {
            balance_direction = 0;
        }
        break;
}
