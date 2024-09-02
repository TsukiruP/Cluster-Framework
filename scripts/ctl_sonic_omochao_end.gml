/// ctl_sonic_omochao_end()

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_omochao;
    image_index  = 6;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 16, 6, 15);
    set_hitbox();
}

// Change frame:
else if (ctl_position(3)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(6)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(9)) {
    image_index = 3;
}

// Cange frame:
else if (ctl_position(12)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(22)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(24)) {
    image_index = 0;
}

// Null frame:
else if (ctl_position(25)) {
    player_set_animation("stand");
}
