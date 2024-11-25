/// ctl_sonic_spin_dash()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_spin_dash;
    image_index = 0;

    // Set collision:
    radii_set(6, 9, 3, 5);
    hurtbox_set(8, 8, 8, 8);
    hitbox_set(8, 8, 8, 8);
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

// Loop animation:
else if (ctl_position(7))
{
    ctl_moment = 0;
}
