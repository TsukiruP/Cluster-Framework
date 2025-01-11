/// sequence_explosion_water()

if (sequence_position(0))
{
    sprite_index = spr_explosion_water;
    image_index = 0;
}

else if (sequence_position(4))
{
    image_index = 1;
}

else if (sequence_position(8))
{
    image_index = 2;
}

else if (sequence_position(12))
{
    image_index = 3;
}

else if (sequence_position(17))
{
    image_index = 4;
}

else if (sequence_position(23))
{
    image_index = 5;
}

else if (sequence_position(29))
{
    image_index = 6;
}

else if (sequence_position(36))
{
    image_index = 7;
}

else if (sequence_position(44))
{
    image_index = 8;
}

else if (sequence_position(51))
{
    image_index = 9;
}

else if (sequence_position(57))
{
    instance_destroy();
}
