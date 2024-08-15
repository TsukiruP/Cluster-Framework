/// player_state_turn(phase)
// Turn around, every now and then I get a little bit lonely...

switch (argument0) {
    // Start:
    case STATE_START:
        // Reset speed:
        x_speed = 0;

        // Flip direction:
        image_xscale *= -1;
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

        // Idle:
        if (animation_finished == true) {
            player_set_state(player_state_idle);
        }

        // Auxiliary Action:

        // Jump:
        if (player_routine_jump()) {
            return true;
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
