/// seq_rhino_move()

if (sequence_position(0))
{
    sprite_index = spr_rhino;
    image_index = 0;
    hitbox_set_hurtbox(19, 3, 25, 14);
    hitbox_set_attackbox(16, 0, 21, 11);
}
else if (sequence_position(4)) image_index = 1;
else if (sequence_position(8)) image_index = 2;
else if (sequence_position(12)) image_index = 3;
else if (sequence_position(15)) sequence_moment = 0;