/// ctl_sonic_omochao()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_omochao;
    image_index = 0;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
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

// Cange frame:
else if (ctl_position(22))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(26))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(30))
{
    image_index = 6;
}
