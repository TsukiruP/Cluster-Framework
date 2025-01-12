/// sequence_classic_insta()

if (sequence_position(0))
{
    sprite_index = spr_classic_roll;
    image_index = 0;
    radii_set(6, 9, 3, 5);
    hurtbox_set(8, 8, 8, 8);
    hitbox_set(14, 14, 14, 14);
}
else if (sequence_position(1))
{
    image_index = 4;
}
else if (sequence_position(2))
{
    image_index = 1;
}
else if (sequence_position(3))
{
    image_index = 4;
}
else if (sequence_position(4))
{
    image_index = 2;
}
else if (sequence_position(5))
{
    image_index = 4;
}
else if (sequence_position(6))
{
    image_index = 3;
}
else if (sequence_position(7))
{
    image_index = 4;
}
else if (sequence_position(8))
{
    image_index = 0;
}
else if (sequence_position(10))
{
    image_index = 4;
}
else if (sequence_position(12))
{
    image_index = 1;
}
else if (sequence_position(14))
{
    image_index = 4;
}
else if (sequence_position(16))
{
    player_set_animation("spin", 2);
}
