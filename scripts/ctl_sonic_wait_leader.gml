/// ctl_sonic_wait_leader()

if (ctl_position(0))
{
    sprite_index = spr_sonic_wait_leader;
    image_index = 0;

    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 16);
    hitbox_set();
}

else if (ctl_position(8))
{
    image_index = 1;
}

else if (ctl_position(16))
{
    image_index = 2;
}

else if (ctl_position(26))
{
    image_index = 3;
}

else if (ctl_position(33))
{
    image_index = 4;
}

else if (ctl_position(39))
{
    image_index = 5;
}

else if (ctl_position(45))
{
    image_index = 6;
}

else if (ctl_position(51))
{
    image_index = 7;
}

else if (ctl_position(93))
{
    image_index = 8;
}

else if (ctl_position(105))
{
    image_index = 7;
}

else if (ctl_position(117))
{
    image_index = 8;
}

else if (ctl_position(129))
{
    image_index = 7;
}

else if (ctl_position(141))
{
    image_index = 8;
}

else if (ctl_position(153))
{
    image_index = 7;
}

else if (ctl_position(165))
{
    image_index = 8;
}

else if (ctl_position(177))
{
    image_index = 7;
}

else if (ctl_position(219))
{
    image_index = 9;
}

else if (ctl_position(227))
{
    image_index = 10;
}

else if (ctl_position(233))
{
    image_index = 11;
}

else if (ctl_position(253))
{
    image_index = 12;
}

else if (ctl_position(273))
{
    image_index = 13;
}

else if (ctl_position(293))
{
    image_index = 14;
}

else if (ctl_position(312))
{
    ctl_moment = 233;
}
