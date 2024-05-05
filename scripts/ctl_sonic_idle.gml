/// ctl_sonic_idle()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    // Set sprite:
    sprite_index = spr_sonic_idle;
    image_index  = 0;

    // Set collision:

    // Set hurtbox:

    // Set hitbox:
}

// Change frame:
else if (ctl_position(6)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(12)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(18)) {
    image_index = 3;
}

// Cange frame:
else if (ctl_position(24)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(30)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(36)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(42)) {
    image_index = 7;
}

// Change frame:
else if (ctl_position(48)) {
    image_index = 8;
}

// Change frame:
else if (ctl_position(54)) {
    image_index = 9;
}

// Change frame:
else if (ctl_position(60)) {
    image_index = 10;
}

// Change frame:
else if (ctl_position(66)) {
    image_index = 11;
}

// Change frame:
else if (ctl_position(72)) {
    image_index = 12;
}

// Change frame:
else if (ctl_position(78)) {
    image_index = 13;
}

// Change frame:
else if (ctl_position(84)) {
    image_index = 14;
}

// Change frame:
else if (ctl_position(90)) {
    image_index = 15;
}

// Change frame:
else if (ctl_position(96)) {
    image_index = 16;
}

// Change frame:
else if (ctl_position(102)) {
    image_index = 17;
}

// Change frame:
else if (ctl_position(108)) {
    image_index = 18;
}

// Change frame:
else if (ctl_position(114)) {
    image_index = 19;
}

// Change frame:
else if (ctl_position(120)) {
    image_index = 20;
}

// Change frame:
else if (ctl_position(126)) {
    image_index = 21;
}

// Change frame:
else if (ctl_position(132)) {
    image_index = 22;
}

// Change frame:
else if (ctl_position(138)) {
    image_index = 23;
}

// Change frame:
else if (ctl_position(144)) {
    image_index = 24;
}

// Change frame:
else if (ctl_position(150)) {
    image_index = 25;
}

// Change frame:
else if (ctl_position(162)) {
    image_index = 26;
}

// Change frame:
else if (ctl_position(168)) {
    image_index = 27;
}

// Change frame:
else if (ctl_position(174)) {
    image_index = 28;
}

// Change frame:
else if (ctl_position(180)) {
    image_index = 29;
}

// Change frame:
else if (ctl_position(192)) {
    image_index = 30;
}

// Change frame:
else if (ctl_position(200)) {
    image_index = 31;
}

// Change frame:
else if (ctl_position(206)) {
    image_index = 32;
}

// Change frame:
else if (ctl_position(212)) {
    image_index = 33;
}

// Change frame:
else if (ctl_position(218)) {
    image_index = 34;
}

// Null frame:
else if (ctl_position(223)) {
    ctl_time = 0;
}
