/// seq_jawz_move()

if (sequence_position(0))
{
    sprite_index = spr_jawz;
    image_index = 0;
    hitbox_set_hurtbox(24, 10, 30, 14);
    hitbox_set_attackbox(22, 4, 28, 8);
}
else if (sequence_position(4)) image_index = 1;
else if (sequence_position(8)) image_index = 2;
else if (sequence_position(11)) sequence_moment = 0;
