/// ctl_sonic_spring_fall()

// Skip:
if (animation_skip == true)
{
    ctl_skip(9);

    // Set sprite:
    sprite_index = spr_sonic_spring;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 16, 6, 16);
    set_hitbox();
}

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_spring;
    image_index  = 4;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 16, 6, 16);
    set_hitbox();
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

// Null frame:
else if (ctl_position(23))
{
    ctl_time = 16;
}
