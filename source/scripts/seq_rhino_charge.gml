/// seq_rhino_charge()

if (sequence_position(0))
{
    sprite_index = spr_rhino;
    image_index = 6;
    hitbox_set_hurtbox(17, 1, 27, 14);
    hitbox_set_attackbox(13, 5, 22, 5, 0, 7);
}
else if (sequence_position(2)) image_index = 7;
else if (sequence_position(4)) image_index = 8;
else if (sequence_position(5)) sequence_moment = 0;