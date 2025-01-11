/// sequence_sonic_spring_flight()

if (sequence_position(0))
{
    sprite_index = spr_sonic_spring;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 16);
    hitbox_set();
}
else if (sequence_position(3))
{
    image_index = 1;
}
else if (sequence_position(6))
{
    image_index = 2;
}
else if (sequence_position(9))
{
    image_index = 3;
}
else if (sequence_position(11))
{
    sequence_moment = 3;
}
