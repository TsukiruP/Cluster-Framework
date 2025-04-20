/// seq_bomb_hawk_drop()

if (sequence_position(0))
{
    sprite_index = spr_bomb_hawk;
    image_index = 1;
    hitbox_set_hurtbox(16, 10, 16, 13);
    hitbox_set_attackbox(11, 7, 11, 11);
}
else if (sequence_position(4)) image_index = 6;
else if (sequence_position(12))
{
    image_index = 7;
    y_offset = 3;
}
else if (sequence_position(18))
{
    image_index = 8;
    y_offset = 2;
}
else if (sequence_position(24))
{
    image_index = 7;
    y_offset = 1;
}
else if (sequence_position(30))
{
    image_index = 8;
    y_offset = 0;
}
else if (sequence_position(36))
{
    image_index = 7;
    y_offset = 1;
}
else if (sequence_position(42))
{
    image_index = 8;
    y_offset = 2;
}
else if (sequence_position(47)) sequence_set(pick(move, seq_bomb_hawk_idle, seq_bomb_hawk_move));
