/// ctl_sonic_skid_fast()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_skid_fast;
    image_index  = 0;

    // Set collision:
    main_width  = 6;
    main_height = 14;
    roll_offset = 0;

    // Set hurtbox:
    hurtbox_width    = 6;
    hurtbox_height   = 14;
    hurtbox_offset_x = 0;
    hurtbox_offset_y = 1;

    // Set hitbox:
    hitbox_width    = 0;
    hitbox_height   = 0;
    hitbox_offset_x = 0;
    hitbox_offset_y = 0;
}

// Change frame:
else if (ctl_position(1)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(2)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(5)) {
    image_index = 3;
}

// Null frame:
else if (ctl_position(7)) {
    ctl_time = 2;
}
