/// seq_klagen_bomb()

if (sequence_position(0))
{
    sprite_index = spr_klagen_bomb;
    image_index = 0;
    hitbox_set_hurtbox(12, 12, 12, 12);
    hitbox_set_attackbox(10, 2, 10, 14);
}
else if (sequence_position(12)) image_index = 1;
else if (sequence_position(24)) image_index = 0;
else if (sequence_position(36)) image_index = 2;
else if (sequence_position(47)) sequence_moment = 0;
