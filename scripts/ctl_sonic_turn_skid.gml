/// ctl_sonic_turn_skid()

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_turn_skid;
    image_index  = 0;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(4, 16, 8, 15);
    set_hitbox();
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

// Finish animation:
else if (ctl_position(7)) {
    animation_finished = true;
}
