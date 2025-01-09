/// ctl_sonic_look_end()

if (ctl_position(0))
{
    sprite_index = spr_sonic_look;
    image_index = 1;

    radii_set(6, 14, 3);
    hurtbox_set(6, 13, 6, 15);
    hitbox_set();
}

else if (ctl_position(2))
{
    image_index = 0;
}

else if (ctl_position(4))
{
    player_set_animation("stand");
}
