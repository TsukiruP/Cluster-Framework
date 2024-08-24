/// player_state_bound()
// No bracelet required!

switch (argument0) {
    // Start:
    case STATE_START:
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
        if (on_ground == true) {
            player_set_state(player_state_air, true);
            jump_state          = true;
            animation_skip      = true;
            status_shield_allow = true;

            // Splash:
            player_effect_splash();

            // Set timeline:
            if (instance_exists(shield_handle)) {
                with (shield_handle) {
                    event_user(1);
                }
            }

            // Play sound:
            sound_play_single("snd_shield_bubble_bound");

            return true;
        }

        // Air friction:
        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0) {
            x_speed *= air_friction;
        }

        // Gravity:
        if (y_allow == true) {
            y_speed += gravity_force;
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
