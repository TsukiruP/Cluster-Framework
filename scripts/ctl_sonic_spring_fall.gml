/// ctl_sonic_spring_fall()

// Skip:
if (animation_skip == true)
{
    ctl_skip(9);

    // Set sprite:
    sprite_index = spr_sonic_spring;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 16);
    hitbox_set();
}

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_spring;
    image_index = 4;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 16);
    hitbox_set();
}

// Change frame:
else if (ctl_position(2))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(4))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(9))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(15))
{
    image_index = 10;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 11;
}

// Change frame:
else if (ctl_position(21))
{
    image_index = 12;
}

// Loop animation:
else if (ctl_position(23))
{
    ctl_moment = 16;
}
