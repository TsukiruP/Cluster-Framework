/// ctl_sonic_spin_fall()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_spin_fall;
    image_index = 0;

    // Set collision:
    radii_set(6, 9, 3, 5);
    hurtbox_set(6, 6, 6, 4);
    hitbox_set(6, 9, 6, 9);
}

// Change frame:
else if (ctl_position(1))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(3))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(5))
{
    image_index = 3;
}

// Loop animation:
else if (ctl_position(6))
{
    ctl_time = 1;
}
