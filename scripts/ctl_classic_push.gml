/// ctl_classic_push()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_classic_push;
    image_index = 0;

    // Set collision:
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
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
    ctl_moment = 0;
}
