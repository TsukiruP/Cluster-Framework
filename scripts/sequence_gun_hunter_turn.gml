/// sequence_gun_hunter_turn()

if (sequence_position(0))
{
    sprite_index = spr_gun_hunter;
    image_index = 6;
}
else if (sequence_position(1))
{
    image_index = 1;
    image_xscale *= -1;
}
else if (sequence_position(2)) sequence_set(sequence_gun_hunter_move);
