/// player_action_hurt(phase)
// Ouchie ouch ouch.

switch (argument0) {
    // Start:
    case ACTION_START:
        // Set ground:
        ground = false;
        break;

    // Step:
    case ACTION_STEP:
        // Collision steps:
        player_collision_steps();

        // Changed:
        if (action_changed == true) {
            return false;
        }

        // Land:
        if (ground == true) {
            // Reset movement:
            if (global.advance_hurt == false) g_speed = 0;
            y_speed = 0;

            return player_set_action(player_action_idle);
        }

        // Gravity:
        if (y_allow == true) {
            y_speed += gravity_force;
        }
        break;

    // Finish:
    case ACTION_FINISH:
        // Set invincibility:
        status_invin_alarm = 120;
        break;
}
