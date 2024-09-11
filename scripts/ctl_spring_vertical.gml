/// ctl_spring_vertical()

// Start animation:
if (ctl_position(0))
{
    image_index = 1;

    // Set hurtbox:
    set_hurtbox(5, 2, 5, 15);
}

// Change frame:
else if (ctl_position(2))
{
    image_index = 2;

    // Set hurtbox:
    set_hurtbox(5, 17, 5, 15);
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 3;

    // Set hurtbox:
    set_hurtbox(5, 13, 5, 15);
}

// Change frame:
else if (ctl_position(8))
{
    image_index = 4;

    // Set hurtbox:
    set_hurtbox(5, 16, 5, 15);
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 5;

    // Set hurtbox:
    set_hurtbox(5, 13, 5, 15);
}

// Change frame:
else if (ctl_position(14))
{
    activated = false;

    // Set hurtbox:
    set_hurtbox(5, 4, 5, 15);
}
