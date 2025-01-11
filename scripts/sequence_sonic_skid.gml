/// sequence_sonic_skid()

if (sequence_position(0))
{
    sprite_index = spr_sonic_skid;
    image_index = 11;
    radii_set(6, 14, 3);
    hurtbox_set(14, 1, 14, 17);
    hitbox_set(3, 7, 21, 18);
}

else if (sequence_position(2))
{
    image_index = 12;
}

else if (sequence_position(4))
{
    image_index = 13;
}

else if (sequence_position(5))
{
    sequence_moment = 0;
}
