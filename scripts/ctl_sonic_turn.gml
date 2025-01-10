/// ctl_sonic_turn()

if (ctl_position(0))
{
    sprite_index = spr_sonic_turn;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(8, 16, 4, 15);
    hitbox_set();
}

else if (ctl_position(1))
{
    image_index = 1;
}

else if (ctl_position(2))
{
    animation_finished = true;
}
