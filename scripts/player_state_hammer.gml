/// player_state_hammer()
//

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

        // Jump:
        if (player_routine_jump()) {
            return true;
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
