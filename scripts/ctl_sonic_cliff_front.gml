/// ctl_sonic_cliff_front()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_cliff_front;
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
else if (ctl_position(6))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(9))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(15))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(21))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(24))
{
    image_index = 8;
}

// Loop animation:
else if (ctl_position(26))
{
    ctl_moment = 3;
}
