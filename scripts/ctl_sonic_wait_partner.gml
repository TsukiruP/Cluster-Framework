/// ctl_sonic_wait_partner()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_wait_partner;
    image_index  = 0;

    // Set collision:
    main_width  = 6;
    main_height = 14;
    roll_offset = 0;

    // Set hurtbox:
    hurtbox_width    = 6;
    hurtbox_height   = 15.5;
    hurtbox_offset_x = 0;
    hurtbox_offset_y = 0;

    // Set hitbox:
    hitbox_width    = 0;
    hitbox_height   = 0;
    hitbox_offset_x = 0;
    hitbox_offset_y = 0;
}

// Change frame:
else if (ctl_position(8)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(16)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(24)) {
    image_index = 3;
}

// Cange frame:
else if (ctl_position(32)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(40)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(48)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(56)) {
    image_index = 7;
}

// Change frame:
else if (ctl_position(64)) {
    image_index = 8;
}

// Change frame:
else if (ctl_position(72)) {
    image_index = 9;
}

// Change frame:
else if (ctl_position(80)) {
    image_index = 10;
}

// Change frame:
else if (ctl_position(88)) {
    image_index = 11;
}

// Change frame:
else if (ctl_position(96)) {
    image_index = 12;
}

// Change frame:
else if (ctl_position(112)) {
    image_index = 13;
}

// Change frame:
else if (ctl_position(120)) {
    image_index = 14;
}

// Change frame:
else if (ctl_position(128)) {
    image_index = 15;
}

// Change frame:
else if (ctl_position(170)) {
    image_index = 16;
}

// Change frame:
else if (ctl_position(178)) {
    image_index = 17;
}

// Change frame:
else if (ctl_position(186)) {
    image_index = 18;
}

// Change frame:
else if (ctl_position(194)) {
    image_index = 19;
}

// Change frame:
else if (ctl_position(202)) {
    image_index = 20;
}

// Change frame:
else if (ctl_position(210)) {
    image_index = 21;
}

// Change frame:
else if (ctl_position(270)) {
    image_index = 22;
}

// Null frame:
else if (ctl_position(277)) {
    ctl_time = 24;
}
