/// ctl_sonic_insta()

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_insta;
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
    hitbox_left     = 15;
    hitbox_right    = 13;
    hitbox_top      = 14;
    hitbox_bottom   = 14;

    hitbox_offset_x = 0;
    hitbox_offset_y = 0;
}

// Change frame:
else if (ctl_position(1)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(2)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(3)) {
    image_index = 3;
}

// Change frame:
else if (ctl_position(4)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(5)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(6)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(7)) {
    image_index = 7;
}

// Change frame:
else if (ctl_position(8)) {
    sprite_index = spr_sonic_roll;
    image_index  = 0;
}

// Change frame:
else if (ctl_position(10)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(12)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(14)) {
    image_index = 3;
}

// Change animation:
else if (ctl_position(15)) {
    player_set_animation("spin", 4);
}
