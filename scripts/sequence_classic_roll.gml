/// sequence_classic_roll()

if (sequence_position(0))
{
    sprite_index = spr_classic_roll;
    image_index = 0;
    radii_set(6, 9, 3, 3);
    hurtbox_set(8, 8, 8, 8);
    hitbox_set(6, 9, 6, 9);
}
else if (sequence_position(4))
{
    image_index = 4;
}
else if (sequence_position(8))
{
    image_index = 1;
}
else if (sequence_position(12))
{
    image_index = 4;
}
else if (sequence_position(16))
{
    image_index = 2;
}
else if (sequence_position(20))
{
    image_index = 4;
}
else if (sequence_position(24))
{
    image_index = 3;
}
else if (sequence_position(28))
{
    image_index = 4;
}
else if (sequence_position(31))
{
    sequence_moment = 0;
}
