/// ctl_sonic_crouch_end()

if (ctl_position(0))
{
    sprite_index = spr_sonic_crouch;
    image_index = 1;

    radii_set(6, 14, 3);
    hurtbox_set(6, 6, 6, 15);
    hitbox_set();
}

else if (ctl_position(1))
{
    image_index = 0;
}

else if (ctl_position(2))
{
    player_set_animation("stand");
}
