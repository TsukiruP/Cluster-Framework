/// ctl_shield_magnetic()

// Set speed:
ctl_update(1);

// Start effect:
if (ctl_position(0)) {
    sprite_index = spr_shield_magnetic;
    image_index  = 0;
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

// Change frame:
else if (ctl_position(12)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(15)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(18)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(21)) {
    image_index = 7;
}

// Change frame:
else if (ctl_position(24)) {
    image_index = 8;
}

// Change frame:
else if (ctl_position(27)) {
    image_index = 9;
}

// Change frame:
else if (ctl_position(30)) {
    image_index = 10;
}

// Change frame:
else if (ctl_position(33)) {
    image_index = 11;
}

// Change frame:
else if (ctl_position(36)) {
    image_index = 12;
}

// Change frame:
else if (ctl_position(39)) {
    image_index = 13;
}

// Change frame:
else if (ctl_position(42)) {
    image_index = 14;
}

// Change frame:
else if (ctl_position(45)) {
    image_index = 15;
}

// Null frame:
else if (ctl_position(47)) {
    ctl_time = 0;
}
