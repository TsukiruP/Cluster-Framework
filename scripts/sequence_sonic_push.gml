/// sequence_sonic_push()

if (sequence_position(0))
{
    sprite_index = spr_sonic_push;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 13, 6, 15);
    hitbox_set();
}

else if (sequence_position(4))
{
    image_index = 1;
}

else if (sequence_position(10))
{
    image_index = 2;
}

else if (sequence_position(16))
{
    image_index = 3;
}

else if (sequence_position(22))
{
    image_index = 4;
}

else if (sequence_position(28))
{
    image_index = 5;
}

else if (sequence_position(34))
{
    image_index = 6;
}

else if (sequence_position(40))
{
    image_index = 7;
}

else if (sequence_position(46))
{
    image_index = 8;
}

else if (sequence_position(51))
{
    sequence_moment = 4;
}
