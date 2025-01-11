/// sequence_classic_brake()

if (sequence_position(0))
{
    sprite_index = spr_classic_brake;
    image_index = 0;
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}

else if (sequence_position(8))
{
    image_index = 1;
}

else if (sequence_position(15))
{
    sequence_moment = 0;
}
