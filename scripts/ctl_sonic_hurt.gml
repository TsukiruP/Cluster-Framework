/// ctl_sonic_hurt()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    sprite_index = spr_sonic_hurt;
    image_index  = 0;

    // Set collision:
    main_width  = 6;
    main_height = 14;
    roll_offset = 0;

    // Set hurtbox:
    hurtbox_width    = 6;
    hurtbox_height   = 15.5;
    hurtbox_offset_x = 0;
    hurtbox_offset_y = 0;

    // Set hitbox:
    hitbox_width    = 0;
    hitbox_height   = 0;
    hitbox_offset_x = 0;
    hitbox_offset_y = 0;
}

// Change frame:
else if (ctl_position(3)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(11)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(19)) {
    image_index = 3;
}

// Change frame:
else if (ctl_position(27)) {
    image_index = 4;
}
