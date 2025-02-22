/// sequence_jawz_chase()

if (sequence_position(0))
{
    sprite_index = spr_jawz;
    image_index = 7;
    hitbox_set_hurtbox(16, 16, 16, 16);
    hitbox_set_attackbox(12, 12, 12, 12);
}
else if (sequence_position(4)) image_index = 8;
else if (sequence_position(8)) image_index = 9;
else if (sequence_position(11)) sequence_moment = 0;