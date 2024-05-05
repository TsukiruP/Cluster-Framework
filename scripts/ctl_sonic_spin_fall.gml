/// ctl_sonic_spin_fall()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_spin_fall;
    image_index  = 0;

    // Set collision:

    // Set hurtbox:

    // Set hitbox:
}

// Change frame:
else if (ctl_position(1)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(3)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(5)) {
    image_index = 3;
}

// Null frame:
else if (ctl_position(6)) {
    ctl_time = 1;
}
