/// ctl_sonic_spring_fall()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_spring;
    image_index  = 4;

    // Set collision:
    main_width  = 6;
    main_height = 14;
    roll_offset = 0;

    // Set hurtbox:
    hurtbox_width    =  6;
    hurtbox_height   =  15;
    hurtbox_offset_x =  0;
    hurtbox_offset_y = -1;

    // Set hitbox:
    hitbox_width    = 0;
    hitbox_height   = 0;
    hitbox_offset_x = 0;
    hitbox_offset_y = 0;
}

// Change frame:
else if (ctl_position(2)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(4)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(6)) {
    image_index = 7;
}

// Change frame:
else if (ctl_position(9)) {
    image_index = 8;
}

// Change frame:
else if (ctl_position(12)) {
    image_index = 9;
}

// Change frame:
else if (ctl_position(15)) {
    image_index = 10;
}

// Change frame:
else if (ctl_position(18)) {
    image_index = 11;
}

// Change frame:
else if (ctl_position(21)) {
    image_index = 12;
}

// Null frame:
else if (ctl_position(23)) {
    ctl_time = 16;
}
