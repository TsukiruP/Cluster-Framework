/// ctl_reticle()

if (ctl_position(0))
{
    sprite_index = spr_reticle;
    image_index = 0;
}

else if (ctl_position(6))
{
    image_index = 1;
}

else if (ctl_position(12))
{
    image_index = 2;
}

else if (ctl_position(18))
{
    image_index = 3;
}

else if (ctl_position(23))
{
    ctl_moment = 0;
}
