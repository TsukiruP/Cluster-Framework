/// ctl_sonic_spin_flight()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_spin_flight;
    image_index  = 0;

    // Set collision:
    main_width  = 6;
    main_height = 14;
    roll_offset = 0;

    // Set hurtbox:
    hurtbox_width    =  6;
    hurtbox_height   =  15.5;
    hurtbox_offset_x = -1;
    hurtbox_offset_y =  0;

    // Set hitbox:
    hitbox_width    =  6;
    hitbox_height   =  9;
    hitbox_offset_x = -1;
    hitbox_offset_y =  0;
}

// Change frame:
else if (ctl_position(3)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(5)) {
    image_index = 2;

    // Set collision:
    main_width  = 6;
    main_height = 9;
    roll_offset = 5;

    // Set hurtbox:
    hurtbox_width    =  8;
    hurtbox_height   =  8;
    hurtbox_offset_x = -1;
    hurtbox_offset_y =  0;

    // Set hitbox:
    hitbox_width    =  6;
    hitbox_height   =  9;
    hitbox_offset_x = -1;
    hitbox_offset_y =  0;
}

// Change frame:
else if (ctl_position(7)) {
    image_index = 3;
}

// Change frame:
else if (ctl_position(9)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(11)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(13)) {
    sprite_index = spr_sonic_roll;
    image_index  = 0;
}

// Change frame:
else if (ctl_position(15)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(17)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(19)) {
    image_index = 3;
}

// Change frame:
else if (ctl_position(21)) {
    sprite_index = spr_sonic_spin_flight;
    image_index  = 2;
}

// Null frame:
else if (ctl_position(22)) {
    ctl_time = 7;
}
