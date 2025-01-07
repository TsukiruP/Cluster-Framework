/// ctl_classic_cliff_front()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_classic_cliff;
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

// Loop animation:
else if (ctl_position(17))
{
    ctl_moment = 0;
}
