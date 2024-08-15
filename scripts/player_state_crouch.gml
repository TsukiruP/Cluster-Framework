/// player_state_crouch(phase)
// Eyes on the ground.

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

        // Slide off:
        if (relative_angle >= 45 && relative_angle <= 315) {
            // Fall:
            if (relative_angle >= 90 && relative_angle <= 270) {
                return player_set_state(player_state_air);
            }
        }

        // Idle:
        if (animation_trigger == true && input_player[INP_DOWN, CHECK_HELD] == false) {
            animation_reverse = true;
            return player_set_state(player_state_idle);
        }

        // Auxiliary Action:

        // Spin Dash:
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
