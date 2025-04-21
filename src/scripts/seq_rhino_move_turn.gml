/// seq_rhino_move_turn()

if (sequence_position(0))
{
    sprite_index = spr_rhino;
    image_index = 4;
    hitbox_set_hurtbox(16, 3, 20, 14);
    hitbox_set_attackbox(12, 1, 19, 9);
}
else if (sequence_position(1)) image_index = 5;
else if (sequence_position(3))
{
    image_xscale *= -1;
    sequence_set(seq_rhino_move);
}
