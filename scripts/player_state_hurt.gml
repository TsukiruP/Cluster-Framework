/// player_state_hurt(phase)
// Ouchie ouch ouch.

switch (argument0) {
    // Start:
    case STATE_START:
        // Set ground:
        if (ground == true) {
            ground = false;
        }

        // Clock over:
        if (clock_up_state != 0) {
            classic_trait_clock_up(true);
        }
        break;

    // Step:
    case STATE_STEP:
        // Collision steps:
        player_collision_steps();

        // Changed:
        if (state_changed == true) {
            return false;
        }

        // Land:
        if (ground == true) {
            // Reset speed:
            if (global.advance_hurt == false) g_speed = 0;
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
