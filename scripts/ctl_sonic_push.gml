/// ctl_sonic_push()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    sprite_index = spr_sonic_push;
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
else if (ctl_position(4)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(10)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(16)) {
    image_index = 3;
}

// Cange frame:
else if (ctl_position(22)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(28)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(34)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(40)) {
    image_index = 7;
}

// Change frame:
else if (ctl_position(46)) {
    image_index = 8;
}

// Null frame:
else if (ctl_position(51)) {
    ctl_time = 4;
}
