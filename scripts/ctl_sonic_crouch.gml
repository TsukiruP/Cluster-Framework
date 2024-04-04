/// ctl_sonic_crouch()

var ctl_speed;

// Set speed:
ctl_speed = 1;

if (ctl_time >= 0 && ctl_speed != -1 && action_state == ACTION_DEFAULT && animation_trigger == true) {
    ctl_speed *= -1;

    if (ctl_position(1)) ctl_time = 0;
    else if (ctl_time > 1) ctl_time = 1;
}

ctl_update(ctl_speed);

// Start animation:
if (ctl_position(0)) {
    sprite_index = spr_sonic_crouch;
    image_index  = 0;

    // Set collision:
    main_width  = 6;
    main_height = 14;
    roll_offset = 0;

    // Set hurtbox:
    hurtbox_width    = 6;
    hurtbox_height   = 10.5;
    hurtbox_offset_x = 0;
    hurtbox_offset_y = 5;

    // Set hitbox:
    hitbox_width    = 0;
    hitbox_height   = 0;
    hitbox_offset_x = 0;
    hitbox_offset_y = 0;

    // Finish animation:
    if (sign(ctl_speed) == -1) animation_finished = true;
}

// Change frame:
else if (ctl_position(1)) {
    image_index = 1;

    // Animation trigger:
    animation_trigger = true;
}

// Change frame:
else if (ctl_position(2)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(3)) {
    image_index = 3;
}
