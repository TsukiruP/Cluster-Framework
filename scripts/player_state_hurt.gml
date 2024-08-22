/// player_state_hurt(phase)
// Ouchie ouch ouch.

switch (argument0) {
    // Start:
    case STATE_START:
        // Reset ground:
        if (on_ground == true) {
            on_ground = false;
        }

        // Clock over:
        if (clock_up_state != 0) {
            classic_trait_clock_up(true);
        }
        break;

    // Step:
    case STATE_STEP:
        // Movement:
        if (!player_movement_ground()) {
            exit;
        }

        // Land:
        if (on_ground == true) {
            // Reset speed:
            if (global.advance_hurt == false) {
                x_speed = 0;
            }

            y_speed = 0;

            return player_set_state(player_state_idle);
        }

        // Gravity:
        if (y_allow == true) {
            y_speed += gravity_force;
        }
        break;

    // Finish:
    case STATE_FINISH:
        // Set invincibility:
        status_invin_alarm = 120;
        break;
}
