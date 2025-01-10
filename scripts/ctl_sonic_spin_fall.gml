/// ctl_sonic_spin_fall()

if (ctl_position(0))
{
    sprite_index = spr_sonic_spin_fall;
    image_index = 0;
    radii_set(6, 9, 3, 5);
    hurtbox_set(6, 6, 6, 4);
    hitbox_set(6, 9, 6, 9);
}

else if (ctl_position(1))
{
    image_index = 1;
}

else if (ctl_position(3))
{
    image_index = 2;
}

else if (ctl_position(5))
{
    image_index = 3;
}

else if (ctl_position(6))
{
    ctl_moment = 1;
}
