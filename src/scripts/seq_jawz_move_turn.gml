/// seq_jawz_move_turn()

if (sequence_position(0))
{
    sprite_index = spr_jawz;
    image_index = 3;
}
else if (sequence_position(3)) image_xscale *= -1;
else if (sequence_position(5)) sequence_set(seq_jawz_move);
