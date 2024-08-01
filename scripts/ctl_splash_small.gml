/// ctl_splash_small()

// Set speed:
ctl_update(1);

// Start effect:
if (ctl_position(0)) {
    sprite_index = spr_splash_small;
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
else if (ctl_position(7)) {
    image_index = 3;
}

// Change frame:
else if (ctl_position(10)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(13)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(16)) {
    image_index = 6;
}

// Change frame:
else if (ctl_position(19)) {
    image_index = 7;
}

// Finish effect:
else if (ctl_position(21)) {
    instance_destroy();
}
