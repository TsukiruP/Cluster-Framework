/// ctl_sonic_omochao_end()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_omochao;
    image_index = 6;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
    hitbox_set();
}

// Change frame:
else if (ctl_position(3))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(9))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(22))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(24))
{
    image_index = 0;
}

// Change animation:
else if (ctl_position(26))
{
    player_set_animation("stand");
}
