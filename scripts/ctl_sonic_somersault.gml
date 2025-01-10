/// ctl_sonic_somersault()

if (ctl_position(0))
{
    sprite_index = spr_sonic_skid;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 5, 6, 16);
    hitbox_set();
}

else if (ctl_position(2))
{
    image_index = 1;
    hurtbox_set(10, 5, 10, 16);
    hitbox_set(6, 19, 23, 16);
}

else if (ctl_position(4))
{
    image_index = 2;
}

else if (ctl_position(6))
{
    image_index = 3;
}

else if (ctl_position(7))
{
    image_index = 4;
}

else if (ctl_position(8))
{
    image_index = 5;
}

else if (ctl_position(9))
{
    image_index = 6;
}

else if (ctl_position(10))
{
    image_index = 7;
}

else if (ctl_position(11))
{
    image_index = 8;
}

else if (ctl_position(12))
{
    image_index = 9;
}

else if (ctl_position(13))
{
    image_index = 10;
}

else if (ctl_position(14))
{
    animation_finished = true;
}
