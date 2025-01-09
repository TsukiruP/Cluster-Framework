/// ctl_explosion_large()

if (ctl_position(0))
{
    sprite_index = spr_explosion_large;
    image_index = 0;
}

else if (ctl_position(3))
{
    image_index = 1;
}

else if (ctl_position(6))
{
    image_index = 2;
}

else if (ctl_position(10))
{
    image_index = 3;
}

else if (ctl_position(14))
{
    image_index = 4;
}

else if (ctl_position(18))
{
    image_index = 5;
}

else if (ctl_position(22))
{
    image_index = 6;
}

else if (ctl_position(27))
{
    image_index = 7;
}

else if (ctl_position(32))
{
    image_index = 8;
}

else if (ctl_position(38))
{
    image_index = 9;
}

else if (ctl_position(44))
{
    instance_destroy();
}
