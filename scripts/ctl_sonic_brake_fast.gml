/// ctl_sonic_brake_fast()

if (ctl_position(0))
{
    sprite_index = spr_sonic_brake_fast;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 13, 6, 15);
    hitbox_set();
}

else if (ctl_position(1))
{
    image_index = 1;
}

else if (ctl_position(2))
{
    image_index = 2;
}

else if (ctl_position(5))
{
    image_index = 3;
}

else if (ctl_position(7))
{
    ctl_moment = 2;
}
