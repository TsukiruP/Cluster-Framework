/// ctl_classic_roll()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_classic_roll;
    image_index = 0;

    // Set collision:
    radii_set(6, 9, 3, 3);
    hurtbox_set(8, 8, 8, 8);
    hitbox_set(6, 9, 6, 9);
}

// Change frame:
else if (ctl_position(4))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(8))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(16))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(20))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(24))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(28))
{
    image_index = 4;
}

// Loop animation:
else if (ctl_position(31))
{
    ctl_moment = 0;
}
