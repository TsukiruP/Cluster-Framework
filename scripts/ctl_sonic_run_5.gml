/// ctl_sonic_run_5()

if (ctl_position(0))
{
    sprite_index = spr_sonic_run_5;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
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

else if (ctl_position(24))
{
    image_index = 3;
}

else if (ctl_position(31))
{
    ctl_moment = 0;
}
