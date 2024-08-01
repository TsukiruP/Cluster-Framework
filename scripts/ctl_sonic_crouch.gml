/// ctl_sonic_crouch()

// Reverse:
if (animation_trigger == true && animation_reverse == true) {
    ctl_time          = 1;
    animation_trigger = false;
}

// Forward:
if (animation_reverse == false) {
    // Start animation:
    if (ctl_position(0)) {
        // Set sprite:
        sprite_index = spr_sonic_crouch;
        image_index  = 0;

        // Set size:
        main_left   = 6;
        main_right  = 6;
        main_top    = 14;
        main_bottom = 14;

        roll_offset = 0;

        // Set hurtbox:
        hurtbox_left     = 6;
        hurtbox_right    = 6;
        hurtbox_top      = 6;
        hurtbox_bottom   = 15;

        hurtbox_offset_x = 0;
        hurtbox_offset_y = 0;

        // Set hitbox:
        hitbox_left     = 0;
        hitbox_right    = 0;
        hitbox_top      = 0;
        hitbox_bottom   = 0;

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
        // Set sprite:
        sprite_index = spr_sonic_crouch;
        image_index  = 1;

        // Set size:
        main_left   = 6;
        main_right  = 6;
        main_top    = 14;
        main_bottom = 14;

        roll_offset = 0;

        // Set hurtbox:
        hurtbox_left     = 6;
        hurtbox_right    = 6;
        hurtbox_top      = 6;
        hurtbox_bottom   = 15;

        hurtbox_offset_x = 0;
        hurtbox_offset_y = 0;

        // Set hitbox:
        hitbox_left     = 0;
        hitbox_right    = 0;
        hitbox_top      = 0;
        hitbox_bottom   = 0;

        hitbox_offset_x = 0;
        hitbox_offset_y = 0;
    }

    // Change frame:
    else if (ctl_position(1)) {
        image_index = 0;

        player_set_animation("stand");
    }
}
