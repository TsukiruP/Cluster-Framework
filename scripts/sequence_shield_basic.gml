/// sequence_shield_basic()

if (sequence_position(0))
{
    sprite_index = spr_shield_basic;
    image_index = 0;
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

else if (sequence_position(12))
{
    image_index = 4;
}

else if (sequence_position(15))
{
    image_index = 5;
}

else if (sequence_position(17))
{
    sequence_moment = 0;
}
