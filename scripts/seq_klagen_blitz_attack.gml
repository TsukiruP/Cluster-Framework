/// seq_klagen_blitz_attack()

if (sequence_position(0))
{
    sprite_index = spr_klagen_blitz;
    image_index = 3;
    attackbox_element = ELEM_LIGHTNING;
    y_offset = 0;
    hitbox_set_hurtbox(6, 4, 6, 8);
    hitbox_set_attackbox(20, 18, 18, 24);
}
else if (sequence_position(4)) image_index = 4;
else if (sequence_position(8)) image_index = 5;
else if (sequence_position(12))
{
    image_index = 6;
    klagen_count += 1;
}
else if (sequence_position(15)) sequence_moment = 0;
