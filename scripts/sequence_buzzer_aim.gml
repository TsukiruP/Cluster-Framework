/// sequence_buzzer_aim()

if (sequence_position(0))
{
    sprite_index = spr_buzzer;
    image_index = 0;
    hitbox_set_hurtbox(8, 8, 8, 12);
    hitbox_set_attackbox(8, 8, 8, 12);
}
else if (sequence_position(2)) image_index = 1;
else if (sequence_position(3)) sequence_moment = 0;
