/// seq_bomb_hawk_idle()

if (sequence_position(0))
{
    sprite_index = spr_bomb_hawk;
    image_index = 0;
    y_offset = 0;
    hitbox_set_hurtbox(16, 10, 16, 13);
    hitbox_set_attackbox(11, 7, 11, 11);
}
else if (sequence_position(6))
{
    image_index = 1;
    y_offset = 1;
}
else if (sequence_position(12))
{
    image_index = 0;
    y_offset = 2;
}
else if (sequence_position(18))
{
    image_index = 1;
    y_offset = 3;
}
else if (sequence_position(24))
{
    image_index = 0;
    y_offset = 2;
}
else if (sequence_position(30))
{
    image_index = 1;
    y_offset = 1;
}
else if (sequence_position(35)) sequence_moment = 0;