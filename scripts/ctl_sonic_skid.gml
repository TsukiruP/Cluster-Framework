/// ctl_sonic_skid()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_skid;
    image_index = 11;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(14, 1, 14, 17);
    hitbox_set(3, 7, 21, 18);
}

// Change frame:
else if (ctl_position(2))
{
    image_index = 12;
}

// Change frame:
else if (ctl_position(4))
{
    image_index = 13;
}

// Loop animation:
else if (ctl_position(5))
{
    ctl_time = 0;
}
