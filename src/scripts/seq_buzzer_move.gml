/// seq_buzzer_move()

if (sequence_position(0))
{
    sprite_index = spr_buzzer;
    image_index = 3;
    hitbox_set_hurtbox(8, 2, 8, 10);
    hitbox_set_attackbox(8, 2, 8, 10);
}
else if (sequence_position(2)) image_index = 4;
else if (sequence_position(3)) sequence_moment = 0;
