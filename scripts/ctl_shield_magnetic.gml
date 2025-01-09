/// ctl_shield_magnetic()

if (ctl_position(0))
{
    sprite_index = spr_shield_magnetic;
    image_index = 0;
}

else if (ctl_position(3))
{
    image_index = 1;
}

else if (ctl_position(6))
{
    image_index = 0;
}

else if (ctl_position(9))
{
    image_index = 1;
}

else if (ctl_position(12))
{
    image_index = 2;
}

else if (ctl_position(15))
{
    image_index = 3;
}

else if (ctl_position(18))
{
    image_index = 2;
}

else if (ctl_position(21))
{
    image_index = 3;
}

else if (ctl_position(24))
{
    image_index = 4;
}

else if (ctl_position(27))
{
    image_index = 5;
}

else if (ctl_position(30))
{
    image_index = 4;
}

else if (ctl_position(33))
{
    image_index = 5;
}

else if (ctl_position(36))
{
    image_index = 6;
}

else if (ctl_position(39))
{
    image_index = 7;
}

else if (ctl_position(42))
{
    image_index = 6;
}

else if (ctl_position(45))
{
    image_index = 7;
}

else if (ctl_position(47))
{
    ctl_moment = 0;
}
