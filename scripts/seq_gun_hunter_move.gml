/// seq_gun_hunter_move()

if (sequence_position(0))
{
    sprite_index = spr_gun_hunter;
    image_index = 0;
    hitbox_set_hurtbox(16, 10, 22, 22);
    hitbox_set_attackbox(8, 10, 7, 17);
}
else if (sequence_position(12)) image_index = 1;
else if (sequence_position(20)) image_index = 2;
else if (sequence_position(28)) image_index = 3;
else if (sequence_position(40)) image_index = 4;
else if (sequence_position(48)) image_index = 5;
else if (sequence_position(55)) sequence_moment = 0;
