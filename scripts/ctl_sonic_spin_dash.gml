/// ctl_sonic_spin_dash()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_spin_dash;
    image_index  = 0;

    // Set collision:

    // Set hurtbox:

    // Set hitbox:
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
    ctl_time = 0;
}
