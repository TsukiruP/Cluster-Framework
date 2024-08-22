/// ctl_sonic_spin_flight()

// Skip:
if (animation_skip == true) {
    ctl_skip(5);
    sprite_index = spr_sonic_spin_flight;
}

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_spin_flight;
    image_index  = 0;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(7, 16, 5, 15);
    set_hitbox(7, 9, 5, 9);
}

// Change frame:
else if (ctl_position(3)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(5)) {
    image_index = 2;

    // Set collision:
    player_set_radii(6, 9, 3, 5);
    set_hurtbox(9, 8, 7, 8);
    set_hitbox(7, 9, 5, 9);
}

// Change frame:
else if (ctl_position(7)) {
    image_index = 3;
}

// Change frame:
else if (ctl_position(9)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(11)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(13)) {
    sprite_index = spr_sonic_roll;
    image_index  = 0;
}

// Change frame:
else if (ctl_position(15)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(17)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(19)) {
    image_index = 3;
}

// Change frame:
else if (ctl_position(21)) {
    sprite_index = spr_sonic_spin_flight;
    image_index  = 2;
}

// Null frame:
else if (ctl_position(22)) {
    ctl_time = 7;
}
