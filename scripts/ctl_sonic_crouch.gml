/// ctl_sonic_crouch()

// Reverse:
if (animation_trigger == true && animation_reverse == true) {
    ctl_time          = 1;
    animation_trigger = false;
}

ctl_update(1);

// Forward:
if (animation_reverse == false) {
    // Start animation:
    if (ctl_position(0)) {
        sprite_index = spr_sonic_crouch;
        image_index  = 0;

        // Set collision:
        main_width  = 6;
        main_height = 14;
        roll_offset = 0;

        // Set hurtbox:
        hurtbox_width    = 6;
        hurtbox_height   = 10.5;
        hurtbox_offset_x = 0;
        hurtbox_offset_y = 5;

        // Set hitbox:
        hitbox_width    = 0;
        hitbox_height   = 0;
        hitbox_offset_x = 0;
        hitbox_offset_y = 0;
    }

    // Change frame:
    else if (ctl_position(1)) {
        image_index = 1;

        // Animation trigger:
        animation_trigger = true;
    }

    // Change frame:
    else if (ctl_position(2)) {
        image_index = 2;
    }

    // Change frame:
    else if (ctl_position(3)) {
        image_index = 3;
    }
}

// Backward:
else {
    // Start animation:
    if (ctl_position(0)) {
        sprite_index = spr_sonic_crouch;
        image_index  = 1;

        // Set collision:
        main_width  = 6;
        main_height = 14;
        roll_offset = 0;

        // Set hurtbox:
        hurtbox_width    = 6;
        hurtbox_height   = 10.5;
        hurtbox_offset_x = 0;
        hurtbox_offset_y = 5;

        // Set hitbox:
        hitbox_width    = 0;
        hitbox_height   = 0;
        hitbox_offset_x = 0;
        hitbox_offset_y = 0;
    }

    // Change frame:
    else if (ctl_position(1)) {
        image_index = 0;

        player_set_animation("stand");
    }
}
