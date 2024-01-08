/// player_hitbox()

// Store previous hitbox height:
hitbox_height_temp = hitbox_height;

// Reset roll offset:
if(animation_current != "spin_flight" && animation_current != "roll") roll_offset = 0;

switch(character_data) {
    case CHAR_SONIC:
        // Default hitbox:
        hitbox_width  = 6;
        hitbox_height = 15;

        // Curled hitbox:
        if(animation_current == "spin_flight" || animation_current == "roll" || animation_current == "spin_dash" || animation_current == "super_spin") {
            hitbox_width  = 9;
            hitbox_height = 9;
            roll_offset   = 6;
        }
        break;
}

// Floor position fix:
if((ground == true && ceiling_lock_alarm == 0) || (mode == 0 && action_state == ACTION_JUMP)) {
    x += (hitbox_height_temp - hitbox_height) * x_direction;
    y += (hitbox_height_temp - hitbox_height) * y_direction;
}
