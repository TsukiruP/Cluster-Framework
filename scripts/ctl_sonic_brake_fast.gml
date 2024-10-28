/// ctl_sonic_brake_fast()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_brake_fast;
    image_index = 0;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 13, 6, 15);
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
else if (ctl_position(5))
{
    image_index = 3;
}

// Loop animation:
else if (ctl_position(7))
{
    ctl_time = 2;
}
