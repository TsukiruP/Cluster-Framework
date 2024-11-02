/// ctl_sonic_run_5()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_run_5;
    image_index = 0;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
    hitbox_set();
}

// Change frame:
else if (ctl_position(8))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(16))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(24))
{
    image_index = 3;
}

// Loop animation:
else if (ctl_position(31))
{
    ctl_time = 0;
}
