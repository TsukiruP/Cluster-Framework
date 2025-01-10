/// ctl_classic_cliff_front()

if (ctl_position(0))
{
    sprite_index = spr_classic_cliff;
    image_index = 0;
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}

else if (ctl_position(6))
{
    image_index = 1;
}

else if (ctl_position(12))
{
    image_index = 2;
}

else if (ctl_position(17))
{
    ctl_moment = 0;
}
