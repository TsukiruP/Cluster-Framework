/// ctl_sonic_death()

if (ctl_position(0))
{
    sprite_index = spr_sonic_death;
    image_index = 0;
    radii_set();
    hurtbox_set();
    hitbox_set();
}

else if (ctl_position(3))
{
    image_index = 1;
}

else if (ctl_position(6))
{
    image_index = 2;
}

else if (ctl_position(18))
{
    image_index = 3;
}

else if (ctl_position(20))
{
    image_index = 4;
}

else if (ctl_position(23))
{
    image_index = 5;
}

else if (ctl_position(25))
{
    ctl_moment = 20;
}
