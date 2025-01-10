/// ctl_sonic_stand()

if (ctl_position(0))
{
    sprite_index = spr_sonic_stand;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
    hitbox_set();
}

else if (ctl_position(6))
{
    image_index = 1;
}

else if (ctl_position(12))
{
    image_index = 2;
}

else if (ctl_position(18))
{
    image_index = 3;
}

else if (ctl_position(24))
{
    image_index = 4;
}

else if (ctl_position(30))
{
    image_index = 5;
}

else if (ctl_position(36))
{
    image_index = 6;
}

else if (ctl_position(42))
{
    image_index = 7;
}

else if (ctl_position(48))
{
    image_index = 0;
}

else if (ctl_position(54))
{
    image_index = 8;
}

else if (ctl_position(60))
{
    image_index = 9;
}

else if (ctl_position(66))
{
    image_index = 10;
}

else if (ctl_position(72))
{
    image_index = 4;
}

else if (ctl_position(78))
{
    image_index = 5;
}

else if (ctl_position(84))
{
    image_index = 6;
}

else if (ctl_position(90))
{
    image_index = 7;
}

else if (ctl_position(96))
{
    image_index = 0;
}

else if (ctl_position(102))
{
    image_index = 1;
}

else if (ctl_position(108))
{
    image_index = 2;
}

else if (ctl_position(114))
{
    image_index = 3;
}

else if (ctl_position(120))
{
    image_index = 4;
}

else if (ctl_position(126))
{
    image_index = 5;
}

else if (ctl_position(132))
{
    image_index = 6;
}

else if (ctl_position(138))
{
    image_index = 7;
}

else if (ctl_position(144))
{
    image_index = 11;
}

else if (ctl_position(150))
{
    image_index = 12;
}

else if (ctl_position(162))
{
    image_index = 13;
}

else if (ctl_position(168))
{
    image_index = 14;
}

else if (ctl_position(174))
{
    image_index = 15;
}

else if (ctl_position(180))
{
    image_index = 16;
}

else if (ctl_position(192))
{
    image_index = 17;
}

else if (ctl_position(200))
{
    image_index = 0;
}

else if (ctl_position(206))
{
    image_index = 5;
}

else if (ctl_position(212))
{
    image_index = 6;
}

else if (ctl_position(218))
{
    image_index = 7;
}

else if (ctl_position(223))
{
    ctl_moment = 0;
}
