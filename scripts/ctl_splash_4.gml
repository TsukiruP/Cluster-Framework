/// ctl_splash_4()

if (ctl_position(0))
{
    sprite_index = spr_splash_4;
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
    image_index = 4;
}

else if (ctl_position(10))
{
    instance_destroy();
}
