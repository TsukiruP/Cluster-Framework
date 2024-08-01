/// ctl_sonic_spring_fall()

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_spring;
    image_index  = 4;

    // Set size:
    main_left   = 6;
    main_right  = 6;
    main_top    = 14;
    main_bottom = 14;

    roll_offset = 0;

    // Set hurtbox:
    hurtbox_left     = 6;
    hurtbox_right    = 6;
    hurtbox_top      = 16;
    hurtbox_bottom   = 16;

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
