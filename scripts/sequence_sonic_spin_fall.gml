/// sequence_sonic_spin_fall()

if (sequence_position(0))
{
    sprite_index = spr_sonic_spin_fall;
    image_index = 0;
    radii_set(6, 9, 3, 5);
    hurtbox_set(6, 6, 6, 4);
    hitbox_set(6, 9, 6, 9);
}

else if (sequence_position(1))
{
    image_index = 1;
}

else if (sequence_position(3))
{
    image_index = 2;
}

else if (sequence_position(5))
{
    image_index = 3;
}

else if (sequence_position(6))
{
    sequence_moment = 1;
}
