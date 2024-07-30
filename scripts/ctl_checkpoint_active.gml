/// ctl_checkpoint_active()

// Set speed:
ctl_update(1);

// Start effect:
if (ctl_position(0)) {
    sprite_index = spr_checkpoint;
    image_index  = 6;
}

// Change frame:
else if (ctl_position(4)) {
    image_index = 7;
}

// Change frame:
else if (ctl_position(8)) {
    image_index = 8;
}

// Change frame:
else if (ctl_position(12)) {
    image_index = 9;
}

// Change frame:
else if (ctl_position(16)) {
    image_index = 10;
}

// Change frame:
else if (ctl_position(22)) {
    image_index = 11;
}

// Change frame:
else if (ctl_position(28)) {
    image_index = 12;
}

// Change frame:
else if (ctl_position(34)) {
    image_index = 13;
}

// Change frame:
else if (ctl_position(40)) {
    image_index = 14;
}

// Change frame:
else if (ctl_position(46)) {
    image_index = 15;
}

// Null frame:
else if (ctl_position(51)) {
    ctl_time = 16;
}
