/// ctl_classic_wait_leader()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_classic_wait;
    image_index = 0;

    // Set collision:
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 1;
}

// Loop animation:
else if (ctl_position(23))
{
    ctl_moment = 0;
}
