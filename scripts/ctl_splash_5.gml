/// ctl_splash_5()

if (ctl_position(0))
{
    sprite_index = spr_splash_5;
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

else if (ctl_position(5))
{
    ctl_moment = 0;
}
