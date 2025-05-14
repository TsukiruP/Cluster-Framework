/// seq_jawz_charge()

if (sequence_position(0))
{
    sprite_index = spr_jawz;
    image_index = 4;
}
else if (sequence_position(2)) image_index = 5;
else if (sequence_position(22)) image_index = 4;
else if (sequence_position(24)) image_index = 6;
else if (sequence_position(27)) sequence_set(seq_jawz_chase);