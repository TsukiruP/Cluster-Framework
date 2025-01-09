/// ctl_debuff()

if (ctl_position(0))
{
    sprite_index = spr_debuff;
    image_index = 0;
}

else if (ctl_position(7))
{
    image_index = 1;
}

else if (ctl_position(14))
{
    image_index = 2;
}

else if (ctl_position(21))
{
    image_index = 3;
}

else if (ctl_position(28))
{
    image_index = 4;
}

else if (ctl_position(35))
{
    image_index = 5;
}

else if (ctl_position(41))
{
    ctl_moment = 0;
}
