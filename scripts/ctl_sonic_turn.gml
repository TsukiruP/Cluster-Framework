/// ctl_sonic_turn()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    sprite_index = spr_sonic_turn;
    image_index  = 0;

    // Set collision:
    main_width  = 6;
    main_height = 14;
    roll_offset = 0;

    // Set hurtbox:
    hurtbox_width    =  6;
    hurtbox_height   =  15.5;
    hurtbox_offset_x = -2;
    hurtbox_offset_y =  0;

    // Set hitbox:
    hitbox_width    = 0;
    hitbox_height   = 0;
    hitbox_offset_x = 0;
    hitbox_offset_y = 0;

    // Set direction:
    animation_direction *= -1;
}

// Change frame:
else if (ctl_position(1)) {
    image_index = 1;

    animation_finished = true;
}
