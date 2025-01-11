/// sequence_sonic_spin_flight()

if (animation_skip == true)
{
    sprite_index = spr_sonic_spin_flight;
    sequence_skip(5);
}

if (sequence_position(0))
{
    sprite_index = spr_sonic_spin_flight;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
    hitbox_set(6, 9, 6, 9);
}
else if (sequence_position(3))
{
    image_index = 1;
}
else if (sequence_position(5))
{
    image_index = 2;

    radii_set(6, 9, 3, 5);
    hurtbox_set(7, 8, 7, 8);
    hitbox_set(6, 9, 6, 9);
}
else if (sequence_position(7))
{
    image_index = 3;
}
else if (sequence_position(9))
{
    image_index = 4;
}
else if (sequence_position(11))
{
    image_index = 5;
}
else if (sequence_position(13))
{
    sprite_index = spr_sonic_roll;
    image_index = 0;
}
else if (sequence_position(15))
{
    image_index = 1;
}
else if (sequence_position(17))
{
    image_index = 2;
}
else if (sequence_position(19))
{
    image_index = 3;
}
else if (sequence_position(21))
{
    sprite_index = spr_sonic_spin_flight;
    image_index = 2;
}
else if (sequence_position(22))
{
    sequence_moment = 7;
}
