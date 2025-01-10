/// ctl_sonic_look()

if (ctl_position(0))
{
    sprite_index = spr_sonic_look;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 13, 6, 15);
    hitbox_set();
}

else if (ctl_position(4))
{
    image_index = 1;

    animation_trigger = true;
}

else if (ctl_position(8))
{
    image_index = 2;
}

else if (ctl_position(20))
{
    image_index = 3;
}

else if (ctl_position(32))
{
    image_index = 2;
}

else if (ctl_position(44))
{
    image_index = 4;
}

else if (ctl_position(55))
{
    ctl_moment = 8;
}
