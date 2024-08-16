/// ctl_sonic_omochao()

// Reverse:
if (animation_trigger == true && animation_reverse == true) {
    ctl_time          = 0;
    animation_trigger = false;
}

// Forward:
if (animation_reverse == false) {
    // Start animation:
    if (ctl_position(0)) {
        // Set sprite:
        sprite_index = spr_sonic_omochao;
        image_index  = 0;

        // Set collision:
        player_set_radii(6, 14, 3);
        set_hurtbox(6, 16, 6, 15);
        set_hitbox();
    }

    // Change frame:
    else if (ctl_position(3)) {
        image_index = 1;
    }

    // Change frame:
    else if (ctl_position(6)) {
        image_index = 2;
    }

    // Change frame:
    else if (ctl_position(18)) {
        image_index = 3;
    }

    // Cange frame:
    else if (ctl_position(22)) {
        image_index = 4;
    }

    // Change frame:
    else if (ctl_position(26)) {
        image_index = 5;
    }

    // Change frame:
    else if (ctl_position(30)) {
        image_index = 6;
    }
}

// Backward:
else {
    // Start animation:
    if (ctl_position(0)) {
        // Set sprite:
        sprite_index = spr_sonic_omochao;
        image_index  = 6;

        // Set collision:
        player_set_radii(6, 14, 3);
        set_hurtbox(6, 16, 6, 15);
        set_hitbox();
    }

    // Change frame:
    else if (ctl_position(3)) {
        image_index = 5;
    }

    // Change frame:
    else if (ctl_position(6)) {
        image_index = 4;
    }

    // Change frame:
    else if (ctl_position(9)) {
        image_index = 3;
    }

    // Cange frame:
    else if (ctl_position(12)) {
        image_index = 2;
    }

    // Change frame:
    else if (ctl_position(22)) {
        image_index = 1;
    }

    // Change frame:
    else if (ctl_position(24)) {
        image_index = 0;
    }

    // Null frame:
    else if (ctl_position(25)) {
        player_set_animation("stand");
    }
}
