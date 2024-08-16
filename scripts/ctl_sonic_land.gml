/// ctl_sonic_land()

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_land;
    image_index  = 0;

    // Set radii:
    x_radius    = 6;
    y_radius    = 14;
    y_offset    = 0;

    wall_offset = 3;

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
else if (ctl_position(6)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(10)) {
    image_index = 2;
}

// Null frame:
else if (ctl_position(17)) {
    player_set_animation("stand");
}
