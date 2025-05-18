/// seq_bomb_hawk_move_turn()

if (sequence_position(0))
{
    sprite_index = spr_bomb_hawk;
    image_index = 4;
    y_offset = 0;
    hitbox_set_hurtbox(14, 12, 14, 14);
    hitbox_set_attackbox(9, 8, 10, 10);
}
else if (sequence_position(6)) image_index = 5;
else if (sequence_position(12))
{
    image_index = 1;
    y_offset = 1;
}
else if (sequence_position(17))
{
    image_xscale *= -1;
    sequence_set(seq_bomb_hawk_move);
}
