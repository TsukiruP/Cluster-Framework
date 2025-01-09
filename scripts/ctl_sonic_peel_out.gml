/// ctl_sonic_peel_out()

if (ctl_position(0))
{
    sprite_index = spr_sonic_peel_out;
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

else if (ctl_position(13))
{
    image_index = 3;
}

else if (ctl_position(14))
{
    image_index = 4;
}

else if (ctl_position(15))
{
    image_index = 5;
}

else if (ctl_position(16))
{
    image_index = 6;
}

else if (ctl_position(18))
{
    image_index = 7;
}

else if (ctl_position(20))
{
    image_index = 8;
}

else if (ctl_position(22))
{
    image_index = 9;
}

else if (ctl_position(24))
{
    image_index = 10;
}

else if (ctl_position(26))
{
    image_index = 11;
}

else if (ctl_position(28))
{
    image_index = 12;
}

else if (ctl_position(30))
{
    image_index = 13;
}

else if (ctl_position(32))
{
    image_index = 14;
}

else if (ctl_position(34))
{
    image_index = 15;
}

else if (ctl_position(36))
{
    image_index = 16;
}

else if (ctl_position(37))
{
    ctl_moment = 30;
}
