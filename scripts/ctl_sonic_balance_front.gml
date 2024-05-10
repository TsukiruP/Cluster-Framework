/// ctl_sonic_balance_front()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    sprite_index = spr_sonic_balance_front;
    image_index  = 0;

    // Set collision:
    main_left   = 6;
    main_right  = 6;
    main_top    = 14;
    main_bottom = 14;

    roll_offset = 0;

    // Set hurtbox:
    hurtbox_left     = 6;
    hurtbox_right    = 6;
    hurtbox_top      = 13;
    hurtbox_bottom   = 15;

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
else if (ctl_position(3)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(6)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(9)) {
    image_index = 3;
}

// Cange frame:
else if (ctl_position(12)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(15)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(18)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(21)) {
    image_index = 7;
}

// Change frame:
else if (ctl_position(24)) {
    image_index = 8;
}

// Null frame:
else if (ctl_position(26)) {
    ctl_time = 3;
}
