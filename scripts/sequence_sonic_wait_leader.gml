/// sequence_sonic_wait_leader()

if (sequence_position(0))
{
    sprite_index = spr_sonic_wait_leader;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 16);
    hitbox_set();
}

else if (sequence_position(8))
{
    image_index = 1;
}

else if (sequence_position(16))
{
    image_index = 2;
}

else if (sequence_position(26))
{
    image_index = 3;
}

else if (sequence_position(33))
{
    image_index = 4;
}

else if (sequence_position(39))
{
    image_index = 5;
}

else if (sequence_position(45))
{
    image_index = 6;
}

else if (sequence_position(51))
{
    image_index = 7;
}

else if (sequence_position(93))
{
    image_index = 8;
}

else if (sequence_position(105))
{
    image_index = 7;
}

else if (sequence_position(117))
{
    image_index = 8;
}

else if (sequence_position(129))
{
    image_index = 7;
}

else if (sequence_position(141))
{
    image_index = 8;
}

else if (sequence_position(153))
{
    image_index = 7;
}

else if (sequence_position(165))
{
    image_index = 8;
}

else if (sequence_position(177))
{
    image_index = 7;
}

else if (sequence_position(219))
{
    image_index = 9;
}

else if (sequence_position(227))
{
    image_index = 10;
}

else if (sequence_position(233))
{
    image_index = 11;
}

else if (sequence_position(253))
{
    image_index = 12;
}

else if (sequence_position(273))
{
    image_index = 13;
}

else if (sequence_position(293))
{
    image_index = 14;
}

else if (sequence_position(312))
{
    sequence_moment = 233;
}
