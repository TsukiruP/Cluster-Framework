/// sequence_sonic_peel_out()

if (sequence_position(0))
{
    sprite_index = spr_sonic_peel_out;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
    hitbox_set();
}

else if (sequence_position(6))
{
    image_index = 1;
}

else if (sequence_position(12))
{
    image_index = 2;
}

else if (sequence_position(13))
{
    image_index = 3;
}

else if (sequence_position(14))
{
    image_index = 4;
}

else if (sequence_position(15))
{
    image_index = 5;
}

else if (sequence_position(16))
{
    image_index = 6;
}

else if (sequence_position(18))
{
    image_index = 7;
}

else if (sequence_position(20))
{
    image_index = 8;
}

else if (sequence_position(22))
{
    image_index = 9;
}

else if (sequence_position(24))
{
    image_index = 10;
}

else if (sequence_position(26))
{
    image_index = 11;
}

else if (sequence_position(28))
{
    image_index = 12;
}

else if (sequence_position(30))
{
    image_index = 13;
}

else if (sequence_position(32))
{
    image_index = 14;
}

else if (sequence_position(34))
{
    image_index = 15;
}

else if (sequence_position(36))
{
    image_index = 16;
}

else if (sequence_position(37))
{
    sequence_moment = 30;
}
