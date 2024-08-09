/// player_state_death(phase)
// One is always aware that it lies in wait. Though life is merely a journey to the grave, it must not be undertaken without hope.

switch (argument0) {
    // Start:
    case ACTION_START:
        // Reset ground:
        if (ground == true) {
            ground = false;
        }

        // Set physics:
        x_speed = 0;

        // Reset stats:
        status_shield = SHIELD_NONE;
        status_invin  = INVIN_NONE;
        status_speed  = SPEED_NONE;
        status_panic  = false;
        status_swap   = false;

        // Death alarm:
        death_alarm = 128;

        // Clock over:
        if (clock_up_state != 0) {
            classic_trait_clock_up(true);
        }

        // Set depth:
        depth = -11000;
        break;

    // Step:
    case ACTION_STEP:
        // Collision steps:
        y += y_speed;

        // Gravity:
        y_speed += gravity_force;

        // Death alarm:
        if (death_alarm > 0) {
            death_alarm -= 1;

            // Transition:
            if (death_alarm == 64 && input_cpu == false && death_handle == noone) {
                death_handle = transition_create(room, TRANS_RETRY);
            }
        }
        break;

    // Finish:
    case ACTION_FINISH:
        // Destroy transition:
        if (instance_exists(death_handle)) {
            with (death_handle) {
                instance_destroy();
            }

            death_handle = 0;
        }
        break;
}
