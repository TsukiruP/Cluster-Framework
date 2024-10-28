/// ctl_sonic_air_dash()

// Skip:
if (animation_skip == true)
{
    ctl_skip(8);

    // Set sprite:
    sprite_index = spr_sonic_air_dash;
}

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_air_dash;
    image_index = 0;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(8, 12, 4, 19);
    hitbox_set();
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

// Change frame:
else if (ctl_position(8))
{
    image_index = 4;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(8, 13, 6, 17);
    hitbox_set();
}

// Change frame:
else if (ctl_position(10))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 6;
}

// Loop animation:
else if (ctl_position(13))
{
    ctl_time = 8;
}
