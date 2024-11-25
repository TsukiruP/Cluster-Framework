/// ctl_sonic_cliff_back()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_cliff_back;
    image_index = 0;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 13, 6, 15);
    hitbox_set();
}

// Change frame:
else if (ctl_position(3))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(7))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(11))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(15))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(19))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(23))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(27))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(31))
{
    image_index = 8;
}

// Loop animation:
else if (ctl_position(34))
{
    ctl_moment = 3;
}
