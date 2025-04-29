/// seq_rhino_spring()

if (sequence_position(0))
{
    sprite_index = spr_rhino;
    image_index = 12;
    hitbox_set_hurtbox(17, 4, 26, 14);
    hitbox_set_attackbox(14, 0, 23, 9);
}
else if (sequence_position(2)) image_index = 13;
else if (sequence_position(6)) image_index = 14;
else if (sequence_position(10)) image_index = 15;
else if (sequence_position(14)) image_index = 16;
else if (sequence_position(15)) sequence_set(seq_rhino_move);