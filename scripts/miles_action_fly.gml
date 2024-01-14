/// miles_action_fly()
// Spread your wings - tails? - and prepare for a force.

// Trigger fly:
if (ground == false && tag_animations == false && flight_timer != flight_duration && player_input[INP_JUMP, CHECK_PRESSED] == true) {
    if (action_state == ACTION_DEFAULT || action_state == ACTION_JUMP) {
        action_state  = ACTION_FLY;
        gravity_force = 0.03125;

        // Reset down input to not trigger cancel:
        player_input[INP_DOWN, CHECK_HELD] = false;
    }
}

// Fly:
if (action_state == ACTION_FLY) {
    // Update timer:
    flight_timer = min(flight_timer + 1, flight_duration);

    // Turn:
    if (input_direction != 0 && animation_current != "fly_turn" && animation_direction != input_direction) {
        animation_target     = "fly_turn";
        animation_direction *= -1;
    }

    // Drop:
    if (flight_timer == flight_duration) {
        if (y_speed <= 0) y_speed = 0.03125;
        gravity_force = 0.03125;
    }

    else {
        // Gain height:
        if (y_speed >= -1 && player_input[INP_DOWN, CHECK_HELD] == false && player_input[INP_JUMP, CHECK_PRESSED] == true) gravity_force = -0.125;

        // Cancel flight:
        if (player_input[INP_DOWN, CHECK_HELD] == true && player_input[INP_JUMP, CHECK_PRESSED] == true) {
            action_state     = ACTION_DEFAULT;
            animation_target = "fly_cancel";
            y_speed          = 0;
        }
    }

    // Reset gravity:
    if (y_speed < -1 || player_collision_top(x, y, angle, mask_large)) gravity_force = 0.03125;
}

// Replace animations:
if ((physics_type == PHYS_UNDERWATER && flight_animations == true) || (physics_type == PHYS_DEFAULT && flight_animations == false)) {
    miles_fly_animations();
}

// Variable clean up:
if (ground == true) {
    if (flight_timer != 0) flight_timer = 0;
}
