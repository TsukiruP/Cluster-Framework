/// ctl_sonic_spin_fall()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_spin_fall;
    image_index  = 0;

    // Set collision:
    main_left   = 6;
    main_right  = 6;
    main_top    = 9;
    main_bottom = 9;

    roll_offset = 5;

    // Set hurtbox:
    hurtbox_left     = 7;
    hurtbox_right    = 5;
    hurtbox_top      = 6;
    hurtbox_bottom   = 4;

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
