/// ctl_sonic_skid_turn()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_skid_turn;
    image_index  = 0;

    // Set collision:
    main_width  = 6;
    main_height = 14;
    roll_offset = 0;

    // Set hurtbox:
    hurtbox_width    = 6;
    hurtbox_height   = 15.5;
    hurtbox_offset_x = 2;
    hurtbox_offset_y = 0;

    // Set hitbox:
    hitbox_width    = 0;
    hitbox_height   = 0;
    hitbox_offset_x = 0;
    hitbox_offset_y = 0;

    // Set direction:
    animation_direction *= -1;
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
