/// ctl_sonic_jog()

// Set speed:
ctl_update(clamp(abs(g_speed * 16 * 3) / 64, 0.5, 8));

// Start animation:
if (ctl_position(0)) {
    sprite_index = spr_sonic_jog;
    image_index  = 0;

    // Set collision:

    // Set hurtbox:

    // Set hitbox:
}

// Change frame:
else if (ctl_position(8)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(16)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(24)) {
    image_index = 3;
}

// Cange frame:
else if (ctl_position(32)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(40)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(48)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(56)) {
    image_index = 7;
}

// Null frame:
else if (ctl_position(63)) {
    ctl_time = 0;
}
