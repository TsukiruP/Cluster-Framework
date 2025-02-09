/// sequence_buzzer_shoot()

if (sequence_position(0))
{
    sprite_index = spr_buzzer;
    image_index = 3;
    hitbox_set_hurtbox(8, 8, 8, 12);
    hitbox_set_attackbox(4, 8, 4, 12);
}
else if (sequence_position(8)) image_index = 4;
else if (sequence_position(10)) image_index = 5;
else if (sequence_position(12)) image_index = 3;
else if (sequence_position(16)) image_index = 5;
else if (sequence_position(18)) image_index = 4;
else if (sequence_position(20)) image_index = 3;
else if (sequence_position(52))
{
    buzzer_time = 0;
    sequence_set(pick(move, sequence_buzzer_aim, sequence_buzzer_move));
}
