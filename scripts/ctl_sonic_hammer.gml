/// ctl_sonic_hammer()

if (ctl_position(0))
{
    sprite_index = spr_sonic_hammer;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 13, 6, 15);
    hitbox_set();
}

else if (ctl_position(1))
{
    image_index = 1;
    hurtbox_set(6, 13, 6, 15, -9);
}

else if (ctl_position(2))
{
    image_index = 2;
    hurtbox_set(6, 13, 6, 15, -16);
}

else if (ctl_position(3))
{
    image_index = 3;
}

else if (ctl_position(4))
{
    image_index = 4;
}

else if (ctl_position(6))
{
    image_index = 5;
}

else if (ctl_position(9))
{
    image_index = 6;
    hurtbox_set(6, 13, 6, 15, -11);
}

else if (ctl_position(10))
{
    image_index = 7;
    hurtbox_set(6, 13, 6, 15, -8);
    hitbox_set(15, 15, 15, 18, 3, -20);
}

else if (ctl_position(11))
{
    image_index = 8;
    hurtbox_set(6, 13, 6, 15);
    hitbox_set(16, 23, 16, 15, 16);
}

else if (ctl_position(13))
{
    image_index = 9;
}

else if (ctl_position(15))
{
    image_index = 10;
}

else if (ctl_position(17))
{
    image_index = 11;
}

else if (ctl_position(20))
{
    image_index = 12;
    hitbox_set();
}

else if (ctl_position(23))
{
    image_index = 13;
}

else if (ctl_position(26))
{
    animation_finished = true;
}
