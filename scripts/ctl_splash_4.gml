/// ctl_splash_4()

// Start effect:
if (ctl_position(0)) {
    sprite_index = spr_splash_4;
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
else if (ctl_position(8)) {
    image_index = 4;
}

// Finish effect:
else if (ctl_position(9)) {
    instance_destroy();
}
