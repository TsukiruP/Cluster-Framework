/// ctl_sonic_spin_fall()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_spin_fall;
    image_index  = 0;

    // Set collision:
    main_width  = 6;
    main_height = 9;
    roll_offset = 5;

    // Set hurtbox:
    hurtbox_width    =  6;
    hurtbox_height   =  10;
    hurtbox_offset_x = -1;
    hurtbox_offset_y = -6;

    // Set hitbox:
    hitbox_width    =  6;
    hitbox_height   =  9;
    hitbox_offset_x = -1;
    hitbox_offset_y =  0;
}

// Change frame:
else if (ctl_position(1)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(3)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(5)) {
    image_index = 3;
}

// Null frame:
else if (ctl_position(6)) {
    ctl_time = 1;
}
