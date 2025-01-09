/// ctl_brake()

if (ctl_position(0))
{
    sprite_index = spr_brake;
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
    image_index = 5;
}

else if (ctl_position(12))
{
    image_index = 6;
}

else if (ctl_position(14))
{
    image_index = 7;
}

else if (ctl_position(16))
{
    instance_destroy();
}
