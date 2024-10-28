/// ctl_sonic_look()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_look;
    image_index = 0;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 13, 6, 15);
    hitbox_set();
}

// Change frame:
else if (ctl_position(4))
{
    image_index = 1;

    animation_trigger = true;
}

// Change frame:
else if (ctl_position(8))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(20))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(32))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(44))
{
    image_index = 4;
}

// Loop animation:
else if (ctl_position(55))
{
    ctl_time = 8;
}
