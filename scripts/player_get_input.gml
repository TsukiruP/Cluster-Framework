/// player_get_input()
// Returns the inputs based on control data.

if (input_lock == false) {
    // Player 1:
    if (input_cpu == false) {
        // Register inputs:
        for (i = INP_LEFT; i <= INP_ALT; i += 1) {
            for (j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
                input_player[i, j] = input_check(i, j);
            }
        }
    }

    // Player 2:
    else if (input_cpu == true) {
        // Set partner alarm:
        if (input_check(INP_ANY, CHECK_HELD, DEV_JOYSTICK1)) input_cpu_alarm = 600;

        if (input_cpu_alarm == 0) {
            if (player_exists(0) != noone) {
                var player_handle;

                player_handle = player_exists(0);

                // Move right:
                if ((x < player_handle.x - 16 || (player_handle.y < y - 50 && player_handle.ground == true && player_handle.x_speed > 0)) &&
                    (player_handle.y >= y - 50 || player_handle.ground == false || player_handle.x_speed >= 0)) {
                    input_player[INP_RIGHT, CHECK_HELD] = true;
                } else {
                    input_player[INP_RIGHT, CHECK_HELD] = false;
                }

                // Move left:
                if ((x > player_handle.x + 16 || (player_handle.y < y - 50 && player_handle.ground == true && player_handle.x_speed < 0)) &&
                    (player_handle.y >= y - 50 || player_handle.ground == false || player_handle.x_speed <= 0)) {
                    input_player[INP_LEFT, CHECK_HELD] = true;
                } else {
                    input_player[INP_LEFT, CHECK_HELD] = false;
                }

                // Up & down:
                var queue_up, queue_down;

                queue_up   = ds_queue_dequeue(ctrl_input.partner_input_up);
                queue_down = ds_queue_dequeue(ctrl_input.partner_input_down);

                ds_queue_enqueue(ctrl_input.partner_input_up, player_handle.input_player[INP_UP, CHECK_HELD]);
                ds_queue_enqueue(ctrl_input.partner_input_down, player_handle.input_player[INP_DOWN, CHECK_HELD]);

                input_player[INP_UP, CHECK_HELD] = queue_up;
                input_player[INP_DOWN, CHECK_HELD] = queue_down;

                // Jump:
                if (ground == true && action_current != player_action_look && action_current != player_action_crouch && player_handle.y < y - 50 && player_handle.ground == false) {
                    input_player[INP_JUMP, CHECK_PRESSED] = true;
                } else {
                    input_player[INP_JUMP, CHECK_PRESSED] = false;
                }

                if (action_current == player_action_jump) input_player[INP_JUMP, CHECK_HELD] = true;
                else input_player[INP_JUMP, CHECK_HELD] = false;
            }
        } else {
            // Decrease partner alarm:
            if (input_cpu_alarm > 0) input_cpu_alarm -= 1;

            // Register inputs:
            for (i = INP_LEFT; i <= INP_ALT; i += 1) {
                for (j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
                    input_player[i, j] = input_check(i, j, DEV_JOYSTICK1);
                }
            }
        }
    }
} else if (!instance_exists(ctrl_transition)) {
    // Reset inputs:
    player_reset_input();
}
