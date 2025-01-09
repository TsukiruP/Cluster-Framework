/// ctl_shield_fire_dash()

if (ctl_position(0))
{
    sprite_index = spr_shield_fire_dash;
    image_index = 0;
}

else if (ctl_position(2))
{
    image_index = 1;
}

else if (ctl_position(4))
{
    image_index = 2;
}

else if (ctl_position(6))
{
    image_index = 3;
}

else if (ctl_position(8))
{
    image_index = 2;
}

else if (ctl_position(10))
{
    image_index = 4;
}

else if (ctl_position(12))
{
    image_index = 0;
}
else if (ctl_position(14))
{
    image_index = 1;
}
else if (ctl_position(16))
{
    image_index = 2;
}
else if (ctl_position(18))
{
    image_index = 3;
}
else if (ctl_position(20))
{
    image_index = 2;
}
else if (ctl_position(22))
{
    image_index = 4;
}

else if (ctl_position(23))
{
    ctl_set(ctl_shield_fire);
}
