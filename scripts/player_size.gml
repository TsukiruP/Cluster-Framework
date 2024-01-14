/// player_size()

// Store previous height:
main_height_temp = main_height;

// Reset roll offset:
if (animation_current != "spin_flight" && animation_current != "roll") roll_offset = 0;

switch (character_data) {
    // Sonic:
    default:
        switch (animation_current) {
            // Curled size:
            case "spin_flight":
            case "roll":
            case "spin_dash":
            case "super_spin":
                main_width  = 9;
                main_height = 9;

                roll_offset = 6;
                break;

            // Default size:
            default:
                main_width  = 6;
                main_height = 15;
        }
        break;
}

// Floor position fix:
if ((ground == true && ceiling_lock_alarm == 0) || (mode == 0 && action_state == ACTION_JUMP)) {
    x += (main_height_temp - main_height) * x_direction;
    y += (main_height_temp - main_height) * y_direction;
}
