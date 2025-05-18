/// seq_rhino_ram()

if (sequence_position(0))
{
    sprite_index = spr_rhino;
    image_index = 9;
    hitbox_set_hurtbox(18, 5, 29, 14);
    hitbox_set_attackbox(14, 4, 26, 14);
}
else if (sequence_position(2)) image_index = 10;
else if (sequence_position(4)) image_index = 11;
else if (sequence_position(5)) sequence_moment = 0;
