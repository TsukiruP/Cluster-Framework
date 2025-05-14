/// seq_bomb_hawk_move()

if (sequence_position(0))
{
    sprite_index = spr_bomb_hawk;
    image_index = 2;
    y_offset = 0;
    hitbox_set_hurtbox(14, 11, 13, 14);
    hitbox_set_attackbox(9, 8, 9, 9);
}
else if (sequence_position(6))
{
    image_index = 3;
    y_offset = 1;
}
else if (sequence_position(12))
{
    image_index = 2;
    y_offset = 2;
}
else if (sequence_position(18))
{
    image_index = 3;
    y_offset = 3;
}
else if (sequence_position(24))
{
    image_index = 2;
    y_offset = 2;
}
else if (sequence_position(30))
{
    image_index = 3;
    y_offset = 1;
}
else if (sequence_position(35)) sequence_moment = 0;