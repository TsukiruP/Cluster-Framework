/// player_state_idle(phase)
// Standing here, I realize...

switch (argument0) {
    // Start:
    case STATE_START:
        // Cliff:
        player_set_cliff();
        break;

    // Step:
    case STATE_STEP:
        // Movement:
        if (!player_movement_ground()) {
            exit;
        }

        // Hint:
        if (hint_allow == false) {
            return false;
        }

        // Fall:
        if (on_ground == false) {
            return player_set_state(player_state_air);
        }

        // Slide off:
        if (relative_angle >= 45 && relative_angle <= 315) {
            // Fall:
            if (relative_angle >= 90 && relative_angle <= 270) {
                return player_set_state(player_state_air);
            } else {
                input_lock_alarm = 30;

                return player_set_state(player_state_run);
            }
        }

        // Turn:
        if (global.advance_turn == true && input_x_direction != 0 && image_xscale != input_x_direction) {
            return player_set_state(player_state_turn);
        }

        // Run:
        if (x_speed != 0 || input_x_direction != 0) {
            return player_set_state(player_state_run);
        }

        // Look:
        if (cliff_direction == 0) {
            switch (input_y_direction) {
                // Look:
                case -1:
                    if (animation_current != "look_end") {
                        return player_set_state(player_state_look);
                    }
                    break;

                // Crouch:
                case 1:
                    if (animation_current != "crouch_end") {
                        return player_set_state(player_state_crouch);
                    }
                    break;
            }
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
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
