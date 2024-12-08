/// ctl_sonic_death()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_death;
    image_index = 0;

    // Set collision:
    radii_set();
    hurtbox_set();
    hitbox_set();
}

// Change frame:
else if (ctl_position(3))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(20))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(23))
{
    image_index = 5;
}

// Loop animation:
else if (ctl_position(25))
{
    ctl_moment = 20;
}
