/// ctl_spring_diagonal()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    image_index = 1;

    // Set hurtbox:
    set_hurtbox(6, 2, 4, 8, -4, 3);
}

// Change frame:
else if (ctl_position(2))
{
    image_index = 2;

    // Set hurtbox:
    set_hurtbox(6, 2, 4, 8, 7, -8);
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 3;

    // Set hurtbox:
    set_hurtbox(6, 2, 4, 8, 3, -4);
}

// Change frame:
else if (ctl_position(8))
{
    image_index = 4;

    // Set hurtbox:
    set_hurtbox(6, 2, 4, 8, 6, -7);
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 5;

    // Set hurtbox:
    set_hurtbox(6, 2, 4, 8, 3, -4);
}

// Finish animation:
else if (ctl_position(14))
{
    activated = false;

    // Set hurtbox:
    set_hurtbox(6, 2, 4, 8);
}
