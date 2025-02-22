/// sequence_buzzer_aim_turn()

if (sequence_position(0))
{
    sprite_index = spr_buzzer;
    image_index = 2;
}
else if (sequence_position(3)) image_xscale *= -1;
else if (sequence_position(4)) sequence_set(sequence_buzzer_aim);