/// player_size()

// Store previous height:
main_height_temp = main_height;

// Reset roll offset:
if (animation_current != "spin_flight" && animation_current != "roll" && animation_current != "spin_dash" && animation_current != "super_spin") roll_offset = 0;

switch (character_data) {
    // Sonic:
    default:
        // Default size:
        main_width  = 6;
        main_height = 14;

        // Curled size:
        if ((animation_current == "spin_flight" && animation_current_frame >= animation_loop_frame) || animation_current == "spin_fall" ||
            animation_current == "roll" || animation_current == "spin_dash" || animation_current == "super_spin") {
            main_width  = 6;
            main_height = 9;

            roll_offset = 6;
        }
        break;
}

// Position fix:
if ((ground == true && ceiling_lock_alarm == 0) || (mode == 0 && action_state == ACTION_JUMP && animation_current != "spin_flight")) {
    x += (main_height_temp - main_height) * x_direction;
    y += (main_height_temp - main_height) * y_direction;
}
