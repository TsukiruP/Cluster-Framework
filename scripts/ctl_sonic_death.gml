/// ctl_sonic_death()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    sprite_index = spr_sonic_death;
    image_index  = 0;

    // Set collision:

    // Set hurtbox:

    // Set hitbox:
}

// Change frame:
else if (ctl_position(3)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(6)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(18)) {
    image_index = 3;
}

// Change frame:
else if (ctl_position(20)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(23)) {
    image_index = 5;
}

// Null frame:
else if (ctl_position(25)) {
    ctl_time = 20;
}
