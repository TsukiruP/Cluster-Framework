/// player_action_turn(phase)
// Turn around, every now and then I get a little bit lonely...

switch (argument0) {
    // Start:
    case ACTION_START:
        // Movement:
        g_speed = 0;

        // Animation:
        player_set_animation("turn");
        break;

    // Step:
    case ACTION_STEP:
        // Jump:
        if (touching_ceiling == false && input_player[INP_JUMP, CHECK_PRESSED] == true) {
            return player_set_action(player_action_jump);
        }

        // Collision steps:
        player_collision_steps();

        // Changed:
        if (action_changed == true) {
            return false;
        }

        // Air:
        if (ground == false) {
            return player_set_action(player_action_air);
        }

        // Slope friction:
        if (ground_angle < 135 || ground_angle > 225) {
            if (abs(g_speed) > 0.125 || input_lock_alarm != 0) g_speed -= dsin(ground_angle) * 0.125;
        }

        // Fall down slopes:
        if (mode != 0 && abs(g_speed) < 2.5) {
            if (ground_angle >= 90 && ground_angle <= 270) {
                return player_set_action(player_action_air);
            } else {
                input_lock_alarm = 30;
            }
        }

        // Idle:
        if (animation_finished == true) {
            player_set_action(player_action_idle);
        }
        break;

    // Finish:
    case ACTION_FINISH:
        break;
}
