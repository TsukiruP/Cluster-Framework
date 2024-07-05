/// ctl_template()

// Set speed:
ctl_update(1);

// Start effect:
if (ctl_position(0)) {
    sprite_index = noone;
    image_index  = 0;
}

// Null frame:
else if (ctl_position(15)) {
    ctl_time = 0;
}
