/// ctl_shield_lightning()

// Set speed:
ctl_update(1);

// Start effect:
if (ctl_position(0)) {
    sprite_index = spr_shield_lightning;
    image_index  = 0;
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

// Change frame:
else if (ctl_position(10)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(14)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(18)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(22)) {
    image_index = 7;
}

// Change frame:
else if (ctl_position(26)) {
    image_index = 8;
}

// Change frame:
else if (ctl_position(30)) {
    image_index = 9;
}

// Change frame:
else if (ctl_position(34)) {
    image_index = 10;
}

// Change frame:
else if (ctl_position(38)) {
    image_index = 11;
}

// Change frame:
else if (ctl_position(42)) {
    image_index = 0;
}

// Change frame:
else if (ctl_position(44)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(46)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(48)) {
    image_index = 11;
}

// Change frame:
else if (ctl_position(52)) {
    image_index = 10;
}

// Change frame:
else if (ctl_position(56)) {
    image_index = 9;
}

// Change frame:
else if (ctl_position(60)) {
    image_index = 8;
}

// Change frame:
else if (ctl_position(64)) {
    image_index = 7;
}

// Change frame:
else if (ctl_position(68)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(72)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(76)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(80)) {
    image_index = 3;
}

// Null frame:
else if (ctl_position(83)) {
    ctl_time = 0;
}
