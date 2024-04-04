/// ctl_sonic_look()

var ctl_speed;

// Set speed:
ctl_speed = 1;

if (ctl_time >= -1 && ctl_speed != -2 && action_state == ACTION_DEFAULT && animation_trigger == true) {
    ctl_speed *= -2;


    if (ctl_position(4)) ctl_time = 3;
    else if (ctl_time > 4) ctl_time = 4;
}

ctl_update(ctl_speed);

if (ctl_position(-2)) {
    animation_finished = true;
}

// Start animation:
else if (ctl_position(0)) {
    sprite_index = spr_sonic_look;
    image_index  = 0;

    // Set collision:
    main_width  = 6;
    main_height = 14;
    roll_offset = 0;

    // Set hurtbox:
    hurtbox_width    = 6;
    hurtbox_height   = 14;
    hurtbox_offset_x = 0;
    hurtbox_offset_y = 1;

    // Set hitbox:
    hitbox_width    = 0;
    hitbox_height   = 0;
    hitbox_offset_x = 0;
    hitbox_offset_y = 0;

}


// Change frame:
else if (ctl_position(4)) {
    image_index = 1;

    animation_trigger = true;
}

// Change frame:
else if (ctl_position(8)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(20)) {
    image_index = 3;
}

// Change frame:
else if (ctl_position(32)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(44)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(55)) {
    ctl_time = 8;
}
