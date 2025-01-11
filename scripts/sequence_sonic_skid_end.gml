/// sequence_sonic_skid_end()

if (sequence_position(0))
{
    sprite_index = spr_sonic_crouch;
    image_index = 3;
    radii_set(6, 14, 3);
    hurtbox_set(6, 6, 6, 15);
    hitbox_set();
}

else if (sequence_position(1))
{
    image_index = 1;
}

else if (sequence_position(2))
{
    image_index = 0;
}

else if (sequence_position(3))
{
    animation_finished = true;
}
