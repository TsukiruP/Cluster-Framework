/// ctl_sonic_spring_fall()

if (animation_skip == true)
{
    ctl_skip(9);

    sprite_index = spr_sonic_spring;

    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 16);
    hitbox_set();
}

if (ctl_position(0))
{
    sprite_index = spr_sonic_spring;
    image_index = 4;

    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 16);
    hitbox_set();
}

else if (ctl_position(2))
{
    image_index = 5;
}

else if (ctl_position(4))
{
    image_index = 6;
}

else if (ctl_position(6))
{
    image_index = 7;
}

else if (ctl_position(9))
{
    image_index = 8;
}

else if (ctl_position(12))
{
    image_index = 9;
}

else if (ctl_position(15))
{
    image_index = 10;
}

else if (ctl_position(18))
{
    image_index = 11;
}

else if (ctl_position(21))
{
    image_index = 12;
}

else if (ctl_position(23))
{
    ctl_moment = 16;
}
