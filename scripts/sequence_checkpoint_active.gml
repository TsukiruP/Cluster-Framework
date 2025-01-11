/// sequence_checkpoint_active()

if (sequence_position(0))
{
    // Set sprite:
    sprite_index = spr_checkpoint;
    image_index = 6;
}

else if (sequence_position(4))
{
    image_index = 7;
}

else if (sequence_position(8))
{
    image_index = 8;
}

else if (sequence_position(12))
{
    image_index = 9;
}

else if (sequence_position(16))
{
    image_index = 10;
}

else if (sequence_position(22))
{
    image_index = 11;
}

else if (sequence_position(28))
{
    image_index = 12;
}

else if (sequence_position(34))
{
    image_index = 13;
}

else if (sequence_position(40))
{
    image_index = 14;
}

else if (sequence_position(46))
{
    image_index = 15;
}

else if (sequence_position(51))
{
    sequence_moment = 16;
}
