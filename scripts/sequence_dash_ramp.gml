/// sequence_dash_ramp()

if (sequence_position(0))
{
    sprite_index = spr_dash_ramp;
    image_index = 0;
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(9)) image_index = 3;
else if (sequence_position(12)) image_index = 4;
else if (sequence_position(15)) image_index = 5;
else if (sequence_position(18)) image_index = 6;
else if (sequence_position(21)) image_index = 7;
else if (sequence_position(24)) image_index = 8;
else if (sequence_position(27)) image_index = 9;
else if (sequence_position(30)) image_index = 10;
else if (sequence_position(33)) image_index = 11;
else if (sequence_position(36)) image_index = 12;
else if (sequence_position(39)) image_index = 13;
else if (sequence_position(42)) image_index = 14;
else if (sequence_position(44)) sequence_moment = 0;
