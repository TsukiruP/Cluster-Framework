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

        // Set collision:
        player_set_radii(6, 14, 3);
        set_hurtbox(6, 6, 6, 15);
        set_hitbox();
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

        // Set collision:
        player_set_radii(6, 14, 3);
        set_hurtbox(6, 6, 6, 15);
        set_hitbox();
    }

    // Change frame:
    else if (ctl_position(1)) {
        image_index = 0;

        player_set_animation("stand");
    }
}
