/// ctl_sonic_ready()

// Set speed:
ctl_update(1);

// Start effect:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_ready;
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
else if (ctl_position(4)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(16)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(20)) {
    image_index = 3;
}

// Change frame:
else if (ctl_position(24)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(28)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(32)) {
    image_index = 6;
}


// Change frame:
else if (ctl_position(38)) {
    image_index = 5;
}


// Change frame:
else if (ctl_position(42)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(48)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(52)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(58)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(62)) {
    image_index = 7;
}

// Change frame:
else if (ctl_position(66)) {
    image_index = 3;
}

// Change frame:
else if (ctl_position(70)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(74)) {
    image_index = 8;
}

// Change frame:
else if (ctl_position(78)) {
    image_index = 9;
}

// Change frame:
else if (ctl_position(82)) {
    image_index = 10;
}

// Change frame:
else if (ctl_position(86)) {
    image_index = 11;
}

// Change frame:
else if (ctl_position(92)) {
    image_index = 10;
}

// Change frame:
else if (ctl_position(96)) {
    image_index = 9;
}

// Change frame:
else if (ctl_position(102)) {
    image_index = 10;
}

// Change frame:
else if (ctl_position(106)) {
    image_index = 11;
}

// Change frame:
else if (ctl_position(110)) {
    image_index = 9;
}

// Change frame:
else if (ctl_position(114)) {
    image_index = 8;
}

// Change frame:
else if (ctl_position(118)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(122)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(126)) {
    image_index = 12;
}

// Change frame:
else if (ctl_position(130)) {
    image_index = 13;
}

// Change frame:
else if (ctl_position(134)) {
    image_index = 14;
}

// Change frame:
else if (ctl_position(138)) {
    image_index = 15;
}

// Change frame:
else if (ctl_position(142)) {
    image_index = 16;
}

// Change frame:
else if (ctl_position(146)) {
    image_index = 13;
}

// Change frame:
else if (ctl_position(150)) {
    image_index = 14;
}

// Change frame:
else if (ctl_position(154)) {
    image_index = 15;
}

// Change frame:
else if (ctl_position(158)) {
    image_index = 16;
}

// Change frame:
else if (ctl_position(162)) {
    image_index = 17;
}

// Null frame:
else if (ctl_position(166)) {
    player_set_animation("stand");
}
