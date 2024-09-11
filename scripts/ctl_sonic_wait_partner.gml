/// ctl_sonic_wait_partner()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_wait_partner;
    image_index  = 0;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 16, 6, 15);
    set_hitbox();
}

// Change frame:
else if (ctl_position(8))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(16))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(24))
{
    image_index = 3;
}

// Cange frame:
else if (ctl_position(32))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(40))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(48))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(56))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(64))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(72))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(80))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(88))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(96))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(112))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(120))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(128))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(170))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(178))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(186))
{
    image_index = 10;
}

// Change frame:
else if (ctl_position(194))
{
    image_index = 11;
}

// Change frame:
else if (ctl_position(202))
{
    image_index = 10;
}

// Change frame:
else if (ctl_position(210))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(270))
{
    image_index = 2;
}

// Null frame:
else if (ctl_position(277))
{
    ctl_time = 24;
}
