/// seq_gun_hunter_bullet()

if (sequence_position(0))
{
    sprite_index = spr_gun_hunter_bullet;
    image_index = 0;
    hitbox_set_attackbox(0, 0, 5, 4);
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(8)) sequence_moment = 0;
