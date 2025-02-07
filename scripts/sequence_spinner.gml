/// sequence_spinner()

if (sequence_position(0))
{
    sprite_index = spr_spinner;
    image_index = 0;
    y_offset = 0;
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(9))
{
    image_index = 3;
    y_offset = 1;
}
else if (sequence_position(12)) image_index = 4;
else if (sequence_position(15))
{
    image_index = 5;
    y_offset = 2;
}
else if (sequence_position(18)) image_index = 0;
else if (sequence_position(21))
{
    image_index = 1;
    y_offset = 3;
}
else if (sequence_position(24)) image_index = 2;
else if (sequence_position(27))
{
    image_index = 3;
    y_offset = 4;
}
else if (sequence_position(30)) image_index = 4;
else if (sequence_position(33))
{
    image_index = 5;
    y_offset = 5;
}
else if (sequence_position(36)) image_index = 0;
else if (sequence_position(39))
{
    image_index = 1;
    y_offset = 6;
}
else if (sequence_position(42)) image_index = 2;
else if (sequence_position(45))
{
    image_index = 3;
    y_offset = 7;
}
else if (sequence_position(48)) image_index = 4;
else if (sequence_position(51)) image_index = 5;
else if (sequence_position(54))
{
    image_index = 0;
    y_offset = 6;
}
else if (sequence_position(57)) image_index = 1;
else if (sequence_position(60))
{
    image_index = 2;
    y_offset = 5;
}
else if (sequence_position(63)) image_index = 3;
else if (sequence_position(66))
{
    image_index = 4;
    y_offset = 4;
}
else if (sequence_position(69)) image_index = 5;
else if (sequence_position(72))
{
    image_index = 0;
    y_offset = 3;
}
else if (sequence_position(75)) image_index = 1;
else if (sequence_position(78))
{
    image_index = 6;
    y_offset = 2;
}
else if (sequence_position(81)) image_index = 7;
else if (sequence_position(84))
{
    image_index = 8;
    y_offset = 1;
}
else if (sequence_position(87)) image_index = 5;
else if (sequence_position(91)) sequence_moment = 0;
