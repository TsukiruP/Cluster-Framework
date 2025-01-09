/// ctl_splash_3()

if (ctl_position(0))
{
    sprite_index = spr_splash_3;
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

else if (ctl_position(7))
{
    image_index = 3;
}

else if (ctl_position(10))
{
    image_index = 4;
}

else if (ctl_position(13))
{
    image_index = 5;
}

else if (ctl_position(16))
{
    instance_destroy();
}
