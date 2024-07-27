/// ctl_sonic_jog_fast()

// Set speed:
ctl_update(clamp(abs(g_speed * 16 * 3) / 64, 0.5, 7));

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_jog_fast;
    image_index  = 0;

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

// Null frame:
else if (ctl_position(63)) {
    ctl_time = 0;
}
