/// seq_buzzer_move_turn()

if (sequence_position(0))
{
    sprite_index = spr_buzzer;
    image_index = 5;
}
else if (sequence_position(3)) image_xscale *= -1;
else if (sequence_position(4)) sequence_set(seq_buzzer_move);
