/// ctl_splash_large()

// Set speed:
ctl_update(1);

// Start effect:
if (ctl_position(0)) {
    sprite_index = spr_splash_large;
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
else if (ctl_position(9)) {
    image_index = 4;
}

// Change frame:
else if (ctl_position(12)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(15)) {
    image_index = 6;
}

// Finish effect:
else if (ctl_position(17)) {
    instance_destroy();
}
