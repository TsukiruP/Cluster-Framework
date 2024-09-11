/// ctl_sonic_wait_leader()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_wait_leader;
    image_index  = 0;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 16, 6, 16);
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
else if (ctl_position(26))
{
    image_index = 3;
}

// Cange frame:
else if (ctl_position(33))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(39))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(45))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(51))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(93))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(105))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(117))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(129))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(141))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(153))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(165))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(177))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(219))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(227))
{
    image_index = 10;
}

// Change frame:
else if (ctl_position(233))
{
    image_index = 11;
}

// Change frame:
else if (ctl_position(253))
{
    image_index = 12;
}

// Change frame:
else if (ctl_position(273))
{
    image_index = 13;
}

// Change frame:
else if (ctl_position(293))
{
    image_index = 14;
}

// Null frame:
else if (ctl_position(312))
{
    ctl_time = 233;
}
