/// ctl_sonic_air_dash()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_air_dash;
    image_index = 0;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 16, 6, 15);
    set_hitbox();
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

// Change frame:
else if (ctl_position(13))
{
    ctl_skip(8);
}
