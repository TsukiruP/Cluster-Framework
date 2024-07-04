/// player_action_crouch(phase)
// Eyes on the ground.

switch (argument0) {
    // Start:
    case ACTION_START:
        break;

    // Step:
    case ACTION_STEP:
        // Collision steps:
        player_collision_steps();

        // Changed:
        if (action_changed == true) {
            return false;
        }

        // Air:
        if (ground == false || (ground_angle >= 90 && ground_angle <= 270)) {
            return player_set_action(player_action_air);
        }

        // Lock:
        if (mode != 0) {
            input_lock_alarm = 30;
            return player_set_action(player_action_run);
        }

        // Slope friction:
        if (ground_angle < 135 || ground_angle > 225) {
            if (abs(g_speed) > 0.125 || input_lock_alarm != 0) {
                g_speed -= dsin(ground_angle) * 0.125;
            }
        }

        // Spin Dash:
        if (input_player[INP_JUMP, CHECK_PRESSED] == true) {
            return player_set_action(player_action_spin_dash);
        }

        // Run:
        if (g_speed != 0) {
            return player_set_action(player_action_run);
        }

        // Cancel:
        if (animation_trigger == true && input_player[INP_DOWN, CHECK_HELD] == false) {
            animation_reverse = true;
            return player_set_action(player_action_idle);
        }
        break;

    // Finish:
    case ACTION_FINISH:
        break;
}
