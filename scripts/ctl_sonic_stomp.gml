/// ctl_sonic_stomp()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_stomp;
    image_index = 0;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
    hitbox_set();
}

// Change frame:
else if (ctl_position(1))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(2))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(3))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(4))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(5))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 6;

    // Set collision:
    hitbox_set(5, 5, 20, 20);
}

// Change frame:
else if (ctl_position(7))
{
    image_index = 7;
    ctl_moment = 6;
}
