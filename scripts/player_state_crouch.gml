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

        // Slope friction:
        player_slope_friction(slope_friction, acceleration);

        // Idle:
        if (animation_trigger == true && input_player[INP_DOWN, CHECK_HELD] == false) {
            // Set animation:
            player_set_animation("crouch_end");

            return player_set_state(player_state_idle);
        }

        // Skill:
        if (player_routine_skill()) {
            return true;
        }

        // Spin Dash:
        if (input_player[INP_JUMP, CHECK_PRESSED] == true) {
            return player_set_state(player_state_spin_dash);
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
