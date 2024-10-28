/// ctl_sonic_stomp()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_stomp;
    image_index = 0;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 16, 6, 15);
    set_hitbox();
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
else if (ctl_position(9))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(15))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 6;

    // Set collision:
    set_hitbox(5, 5, 20, 20);
}

// Change frame:
else if (ctl_position(21))
{
    image_index = 7;
}

// Loop animation:
else if (ctl_position(23))
{
    ctl_time = 18;
}
