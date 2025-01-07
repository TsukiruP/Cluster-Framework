/// ctl_classic_brake()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_classic_brake;
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

// Loop animation:
else if (ctl_position(15))
{
    ctl_moment = 0;
}
