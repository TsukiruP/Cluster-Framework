/// ctl_sonic_hammer()

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_hammer;
    image_index  = 0;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 13, 6, 15);
    set_hitbox();
}

// Change frame:
else if (ctl_position(1)) {
    image_index = 1;

    // Set collision:
    set_hurtbox(6, 13, 6, 15, -9);
}

// Change frame:
else if (ctl_position(2)) {
    image_index = 2;

    // Set collision:
    set_hurtbox(6, 13, 6, 15, -16);
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
else if (ctl_position(6)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(9)) {
    image_index = 6;

    // Set collision:
    set_hurtbox(6, 13, 6, 15, -11);
}

// Change frame:
else if (ctl_position(10)) {
    image_index = 7;

    // Set collision:
    set_hurtbox(6, 13, 6, 15, -8);
    set_hitbox(15, 15, 15, 18, 3, -20);
}

// Change frame:
else if (ctl_position(11)) {
    image_index = 8;

    // Set collision:
    set_hurtbox(6, 13, 6, 15);
    set_hitbox(16, 23, 16, 15, 16);
}

// Change frame:
else if (ctl_position(13)) {
    image_index = 9;
}

// Change frame:
else if (ctl_position(15)) {
    image_index = 10;
}

// Change frame:
else if (ctl_position(17)) {
    image_index = 11;
}

// Change frame:
else if (ctl_position(20)) {
    image_index = 12;

    // Set collision:
    set_hitbox();
}

// Change frame:
else if (ctl_position(23)) {
    image_index = 13;
}

// Finish animation:
else if (ctl_position(25)) {
    animation_finished = true;
}
