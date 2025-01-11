/// sequence_shield_invin()

if (sequence_position(0))
{
    sprite_index = spr_shield_invin;
    image_index = 0;
}

else if (sequence_position(2))
{
    image_index = 1;
}

else if (sequence_position(3))
{
    image_index = 2;
}

else if (sequence_position(6))
{
    image_index = 3;
}

else if (sequence_position(8))
{
    image_index = 4;
}

else if (sequence_position(10))
{
    image_index = 5;
}

else if (sequence_position(11))
{
    sequence_moment = 0;
}
