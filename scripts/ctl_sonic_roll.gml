/// ctl_sonic_roll()

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_roll;
    image_index  = 0;

    // Set size:
    main_left   = 6;
    main_right  = 6;
    main_top    = 9;
    main_bottom = 9;

    roll_offset = 5;

    // Set hurtbox:
    hurtbox_left     = 9;
    hurtbox_right    = 7;
    hurtbox_top      = 8;
    hurtbox_bottom   = 8;

    hurtbox_offset_x = 0;
    hurtbox_offset_y = 0;

    // Set hitbox:
    hitbox_left     = 7;
    hitbox_right    = 5;
    hitbox_top      = 9;
    hitbox_bottom   = 9;

    hitbox_offset_x = 0;
    hitbox_offset_y = 0;
}

// Change frame:
else if (ctl_position(2)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(4)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(6)) {
    image_index = 3;
}

// Null frame:
else if (ctl_position(7)) {
    ctl_time = 0;
}
