/// seq_debuff()

if (sequence_position(0))
{
    sprite_index = spr_debuff;
    image_index = 0;
}
else if (sequence_position(7)) image_index = 1;
else if (sequence_position(14)) image_index = 2;
else if (sequence_position(21)) image_index = 3;
else if (sequence_position(28)) image_index = 4;
else if (sequence_position(35)) image_index = 5;
else if (sequence_position(41)) sequence_moment = 0;
