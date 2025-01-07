/// ctl_classic_cliff_back()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_classic_cliff;
    image_index = 3;

    // Set collision:
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}

// Change frame:
else if (ctl_position(8))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(16))
{
    image_index = 5;
}

// Loop animation:
else if (ctl_position(23))
{
    ctl_moment = 0;
}
