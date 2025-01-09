/// ctl_explosion_enemy()

if (ctl_position(0))
{
    sprite_index = spr_explosion_enemy;
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

else if (ctl_position(9))
{
    image_index = 3;
}

else if (ctl_position(12))
{
    image_index = 4;
}

else if (ctl_position(15))
{
    image_index = 5;
}

else if (ctl_position(18))
{
    image_index = 6;
}

else if (ctl_position(22))
{
    image_index = 7;
}

else if (ctl_position(26))
{
    image_index = 8;
}

else if (ctl_position(30))
{
    image_index = 9;
}

else if (ctl_position(34))
{
    image_index = 10;
}

else if (ctl_position(39))
{
    image_index = 11;
}

else if (ctl_position(45))
{
    instance_destroy();
}
