/// sequence_sonic_brake()

if (sequence_position(0))
{
    sprite_index = spr_sonic_brake;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
    hitbox_set();
}

else if (sequence_position(2))
{
    image_index = 1;

    radii_set(6, 14, 3);
    hurtbox_set(6, 13, 6, 15);
    hitbox_set();
}

else if (sequence_position(6))
{
    image_index = 2;
}

else if (sequence_position(9))
{
    sequence_moment = 2;
}
