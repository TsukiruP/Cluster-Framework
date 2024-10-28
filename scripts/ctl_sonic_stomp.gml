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
else if (ctl_position(2))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(4))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(8))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(14))
{
    image_index = 6;

    // Set collision:
    hitbox_set(5, 5, 20, 20);
}

// Change frame:
else if (ctl_position(16))
{
    image_index = 7;
}

// Loop animation:
else if (ctl_position(17))
{
    ctl_time = 14;
}
