/// ctl_spring()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    image_index = 1;
}

// Change frame:
else if (ctl_position(2)) {
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

// Change frame:
else if (ctl_position(12)) {
    image_index = 5;
}

// Change frame:
else if (ctl_position(13)) {
    spring_active = false;
}
