/// ctl_sonic_ready()

// Start effect:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_ready;
    image_index  = 0;

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
else if (ctl_position(8))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(16))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(22))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(26))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(32))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(36))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(42))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(46))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(50))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(54))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(58))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(62))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(66))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(70))
{
    image_index = 10;
}

// Change frame:
else if (ctl_position(76))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(80))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(86))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(90))
{
    image_index = 10;
}

// Change frame:
else if (ctl_position(94))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(98))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(102))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(106))
{
    image_index = 0;
}

// Change frame:
else if (ctl_position(110))
{
    image_index = 11;
}

// Change frame:
else if (ctl_position(114))
{
    image_index = 12;
}

// Change frame:
else if (ctl_position(122))
{
    image_index = 13;
}

// Change frame:
else if (ctl_position(126))
{
    image_index = 14;
}

// Change frame:
else if (ctl_position(130))
{
    image_index = 15;
}

// Change frame:
else if (ctl_position(134))
{
    image_index = 12;
}

// Change frame:
else if (ctl_position(138))
{
    image_index = 13;
}

// Change frame:
else if (ctl_position(142))
{
    image_index = 14;
}

// Change frame:
else if (ctl_position(146))
{
    image_index = 15;
}

// Change frame:
else if (ctl_position(150))
{
    image_index = 11;
}

// Change frame:
else if (ctl_position(154))
{
    image_index = 0;
}

// Null frame:
else if (ctl_position(161))
{
    player_set_animation("stand");
}
