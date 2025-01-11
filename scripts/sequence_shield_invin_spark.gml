/// sequence_shield_invin_spark()

if (sequence_position(0))
{
    sprite_index = spr_shield_invin_spark;
    image_index = 0;
}

else if (sequence_position(2))
{
    image_index = 1;
}

else if (sequence_position(4))
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

else if (sequence_position(12))
{
    image_index = 6;
}

else if (sequence_position(14))
{
    image_index = 7;
}

else if (sequence_position(16))
{
    image_index = 8;
}

else if (sequence_position(18))
{
    image_index = 9;
}

else if (sequence_position(20))
{
    image_index = 10;
}

else if (sequence_position(22))
{
    image_index = 11;
}

else if (sequence_position(24))
{
    instance_destroy();
}
