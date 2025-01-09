/// ctl_classic_wait_leader()

if (ctl_position(0))
{
    sprite_index = spr_classic_wait;
    image_index = 0;

    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}

else if (ctl_position(18))
{
    image_index = 1;
}

else if (ctl_position(36))
{
    image_index = 2;
}

else if (ctl_position(54))
{
    image_index = 1;
}

else if (ctl_position(71))
{
    ctl_moment = 0;
}
