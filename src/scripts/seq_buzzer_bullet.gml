/// seq_buzzer_bullet()

if (sequence_position(0))
{
    sprite_index = spr_buzzer_bullet;
    image_index = 0;
    hitbox_set_attackbox(3, 3, 3, 3);
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(8)) sequence_moment = 0;
