/// ctl_sonic_spin_charge()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_spin_charge;
    image_index  = 0;

    // Set size:
    main_left   = 6;
    main_right  = 6;
    main_top    = 9;
    main_bottom = 9;

    roll_offset = 5;

    // Set hurtbox:
    hurtbox_left     = 8;
    hurtbox_right    = 8;
    hurtbox_top      = 8;
    hurtbox_bottom   = 8;

    hurtbox_offset_x = 0;
    hurtbox_offset_y = 0;

    // Set hitbox:
    hitbox_left     = 8;
    hitbox_right    = 8;
    hitbox_top      = 8;
    hitbox_bottom   = 8;

    hitbox_offset_x = 0;
    hitbox_offset_y = 0;
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

// Null frame:
else if (ctl_position(7)) {
    player_set_animation("spin_dash");
}
