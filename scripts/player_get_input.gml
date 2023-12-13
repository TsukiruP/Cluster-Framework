/// player_get_input()
// Returns the inputs based on control data.

if(control_lock == false) {
    // Player 1:
    if(control_cpu == false) {
        // Register inputs:
        for(i = INP_LEFT; i <= INP_ALT; i += 1) {
            for(j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
                player_input[i, j] = input_check(i, j);
            }
        }
    }

    // Player 2:
    if(control_cpu == true) {
        // Set partner alarm:
        if(input_check(INP_ANY, CHECK_HELD, DEV_JOYSTICK1)) control_alarm = 600;

        if(control_alarm == 0) {
            if(player_exists(0)) {
                var player_handle;

                player_handle = global.player_instance[0];

                // Move right:
                if((x < player_handle.x - 16 || (player_handle.y < y - 50 && player_handle.ground == true && player_handle.x_speed > 0)) &&
                    (player_handle.y >= y - 50 || player_handle.ground == false || player_handle.x_speed >= 0)) {
                    player_input[INP_RIGHT, CHECK_HELD] = true;
                } else player_input[INP_RIGHT, CHECK_HELD] = false;

                // Move left:
                if((x > player_handle.x + 16 || (player_handle.y < y - 50 && player_handle.ground == true && player_handle.x_speed < 0)) &&
                    (player_handle.y >= y - 50 || player_handle.ground == false || player_handle.x_speed <= 0)) {
                    player_input[INP_LEFT, CHECK_HELD] = true;
                } else player_input[INP_LEFT, CHECK_HELD] = false;

                // Up & down:
                var queue_up, queue_down;

                queue_up   = ds_queue_dequeue(ctrl_input.partner_input_up);
                queue_down = ds_queue_dequeue(ctrl_input.partner_input_down);

                ds_queue_enqueue(ctrl_input.partner_input_up, player_handle.player_input[INP_UP, CHECK_HELD]);
                ds_queue_enqueue(ctrl_input.partner_input_down, player_handle.player_input[INP_DOWN, CHECK_HELD]);

                player_input[INP_UP, CHECK_HELD] = queue_up;
                player_input[INP_DOWN, CHECK_HELD] = queue_down;

                // Jump:
                if(ground == true && action_state != ACTION_CROUCH && action_state != ACTION_LOOK && player_handle.y < y - 50 && player_handle.ground == false) {
                    player_input[INP_JUMP, CHECK_PRESSED] = true;
                } else player_input[INP_JUMP, CHECK_PRESSED] = false;

                if(action_state == ACTION_JUMP) player_input[INP_JUMP, CHECK_HELD] = true;
                else player_input[INP_JUMP, CHECK_HELD] = false;
            }
        } else {
            // Decrease partner alarm:
            if(control_alarm > 0) control_alarm -= 1;

            // Register inputs:
            for(i = INP_LEFT; i <= INP_ALT; i += 1) {
                for(j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
                    player_input[i, j] = input_check(i, j, DEV_JOYSTICK1);
                }
            }
        }
    }
} else {
    // Register inputs:
    for(i = INP_LEFT; i <= INP_ALT; i += 1) {
        for(j = CHECK_HELD; j <= CHECK_RELEASED; j += 1) {
            player_input[i, j] = false;
        }
    }
}
