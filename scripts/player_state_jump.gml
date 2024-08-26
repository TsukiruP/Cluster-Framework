/// player_state_jump(phase)
// A jump to the sky turns to a rider kick.

switch (argument0) {
    // Start:
    case STATE_START:
        var g_speed, leap_force;

        // Set speed:
        g_speed =  x_speed;
        x_speed =  dcos(relative_angle) * g_speed;
        y_speed = -(dsin(relative_angle) * g_speed);

        // Air force:
        leap_force = jump_force;

        if (bound_state == 1) {
            leap_force = 7.5;
        }

        // Jump:
        x_speed -= leap_force * dsin(relative_angle);
        y_speed -= leap_force * dcos(relative_angle);

        // Queue effect:
        if (on_surface == true) {
            effect_queue = EFF_SPLASH;
        }

        // Reset air:
        player_reset_air();
        break;

    // Step:
    case STATE_STEP:
        // Input:
        switch (input_x_direction) {
            // Left:
            case -1:
                if (x_speed > -top_speed) {
                    x_speed -= air_acceleration;
                }
                break;

            // Right:
            case 1:
                if (x_speed < top_speed) {
                    x_speed += air_acceleration;
                }
                break;
        }

        // Direction:
        if (input_x_direction != 0) {
            image_xscale = input_x_direction;
        }

        // Movement:
        if (!player_movement_air()) {
            exit;
        }

        // Land:
        if (player_routine_land()) {
            return true;
        }

        // Variable jump:
        var input_held;

        input_held = input_player[INP_JUMP, CHECK_HELD];

        if (jump_aux == true) {
            input_held = input_player[INP_AUX, CHECK_HELD];
        }

        if (y_speed < jump_release && input_held == false) {
            y_speed = jump_release;
        }

        // Air friction:
        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0) {
            x_speed *= air_friction;
        }

        // Gravity:
        if (y_allow == true) {
            y_speed += gravity_force;
        }

        // Skill:
        if (player_routine_skill()) {
            return true;
        }
        break;

    // Finish:
    case STATE_FINISH:
        // Reset aux jump:
        jump_aux = false;

        // Reset bound:
        if (state_target != player_state_bound) {
            bound_state = 0;
        }
        break;
}
