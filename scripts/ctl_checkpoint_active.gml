/// ctl_checkpoint_active()

if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_checkpoint;
    image_index = 6;
}

else if (ctl_position(4))
{
    image_index = 7;
}

else if (ctl_position(8))
{
    image_index = 8;
}

else if (ctl_position(12))
{
    image_index = 9;
}

else if (ctl_position(16))
{
    image_index = 10;
}

else if (ctl_position(22))
{
    image_index = 11;
}

else if (ctl_position(28))
{
    image_index = 12;
}

else if (ctl_position(34))
{
    image_index = 13;
}

else if (ctl_position(40))
{
    image_index = 14;
}

else if (ctl_position(46))
{
    image_index = 15;
}

else if (ctl_position(51))
{
    ctl_moment = 16;
}
