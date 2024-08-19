/// ctl_sonic_skid()

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_skid;
    image_index  = 0;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 16, 6, 15);
    set_hitbox();
}

// Change frame:
else if (ctl_position(2)) {
    image_index = 1;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 13, 6, 15);
    set_hitbox();
}

// Change frame:
else if (ctl_position(6)) {
    image_index = 2;
}

// Null frame:
else if (ctl_position(9)) {
    ctl_time = 2;
}
