/// ctl_explosion_water()

// Set speed:
ctl_update(1);

// Start effect:
if (ctl_position(0)) {
    sprite_index = spr_explosion_water;
    image_index  = 0;
}

// Change frame:
else if (ctl_position(4)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(8)) {
    image_index = 2;
}

// Change frame:
else if (ctl_position(12)) {
    image_index = 3;
}

// Change frame:
else if (ctl_position(17)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(23)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(29)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(36)) {
    image_index = 7;
}

// Change frame:
else if (ctl_position(44)) {
    image_index = 8;
}

// Change frame:
else if (ctl_position(51)) {
    image_index = 9;
}

// Finish effect:
else if (ctl_position(57)) {
    instance_destroy();
}
