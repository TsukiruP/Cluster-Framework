/// seq_bomb_hawk_explosive()

if (sequence_position(0))
{
    sprite_index = spr_bomb_hawk_explosive;
    image_index = 0;
    hitbox_set_attackbox(3, 10, 3, 4);
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(5)) sequence_moment = 0;
