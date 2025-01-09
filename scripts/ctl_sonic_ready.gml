/// ctl_sonic_ready()

if (ctl_position(0))
{
    sprite_index = spr_sonic_ready;
    image_index = 0;

    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
    hitbox_set();
}

else if (ctl_position(2))
{
    image_index = 1;
}

else if (ctl_position(4))
{
    image_index = 2;
}

else if (ctl_position(8))
{
    image_index = 3;
}

else if (ctl_position(12))
{
    image_index = 4;
}

else if (ctl_position(16))
{
    image_index = 5;
}

else if (ctl_position(22))
{
    image_index = 4;
}

else if (ctl_position(26))
{
    image_index = 3;
}

else if (ctl_position(32))
{
    image_index = 4;
}

else if (ctl_position(36))
{
    image_index = 5;
}

else if (ctl_position(42))
{
    image_index = 4;
}

else if (ctl_position(46))
{
    image_index = 6;
}

else if (ctl_position(50))
{
    image_index = 2;
}

else if (ctl_position(54))
{
    image_index = 1;
}

else if (ctl_position(58))
{
    image_index = 7;
}

else if (ctl_position(62))
{
    image_index = 8;
}

else if (ctl_position(66))
{
    image_index = 9;
}

else if (ctl_position(70))
{
    image_index = 10;
}

else if (ctl_position(76))
{
    image_index = 9;
}

else if (ctl_position(80))
{
    image_index = 8;
}

else if (ctl_position(86))
{
    image_index = 9;
}

else if (ctl_position(90))
{
    image_index = 10;
}

else if (ctl_position(94))
{
    image_index = 9;
}

else if (ctl_position(98))
{
    image_index = 7;
}

else if (ctl_position(102))
{
    image_index = 1;
}

else if (ctl_position(106))
{
    image_index = 0;
}

else if (ctl_position(110))
{
    image_index = 11;
}

else if (ctl_position(114))
{
    image_index = 12;
}

else if (ctl_position(122))
{
    image_index = 13;
}

else if (ctl_position(126))
{
    image_index = 14;
}

else if (ctl_position(130))
{
    image_index = 15;
}

else if (ctl_position(134))
{
    image_index = 12;
}

else if (ctl_position(138))
{
    image_index = 13;
}

else if (ctl_position(142))
{
    image_index = 14;
}

else if (ctl_position(146))
{
    image_index = 15;
}

else if (ctl_position(150))
{
    image_index = 11;
}

else if (ctl_position(154))
{
    image_index = 0;
}

else if (ctl_position(162))
{
    player_set_animation("stand");
}
