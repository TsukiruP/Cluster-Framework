/// player_hitbox()

// Store previous hitbox height:
main_height_temp = main_height;

// Reset roll offset:
if (animation_current != "spin_flight" && animation_current != "roll") roll_offset = 0;

switch (character_data) {
    // Sonic:
    default:
        // Default hitbox:
        main_width  = 6;
        main_height = 15;

        // Curled hitbox:
        if (animation_current == "spin_flight" || animation_current == "roll" || animation_current == "spin_dash" || animation_current == "super_spin") {
            main_width  = 9;
            main_height = 9;
            roll_offset   = 6;
        }
        break;
}

// Floor position fix:
if ((ground == true && ceiling_lock_alarm == 0) || (mode == 0 && action_state == ACTION_JUMP)) {
    x += (main_height_temp - main_height) * x_direction;
    y += (main_height_temp - main_height) * y_direction;
}
