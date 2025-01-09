/// ctl_shield_bubble()

if (ctl_position(0))
{
    sprite_index = spr_shield_bubble_wave;
    image_index = 0;
}

else if (ctl_position(12))
{
    image_index = 1;
}

else if (ctl_position(24))
{
    image_index = 2;
}

else if (ctl_position(36))
{
    image_index = 3;
}

else if (ctl_position(48))
{
    image_index = 4;
}

else if (ctl_position(60))
{
    image_index = 5;
}

else if (ctl_position(72))
{
    image_index = 6;
}

else if (ctl_position(84))
{
    image_index = 7;
}

else if (ctl_position(96))
{
    image_index = 8;
}

else if (ctl_position(107))
{
    ctl_moment = 0;
}
