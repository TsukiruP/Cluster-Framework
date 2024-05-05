/// ctl_sonic_spring_flight()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_spring;
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
else if (ctl_position(9)) {
    image_index = 3;
}

// Null frame:
else if (ctl_position(11)) {
    ctl_time = 3;
}
