/// seq_classic_cliff_front()

if (sequence_position(0))
{
    sprite_index = spr_classic_cliff;
    image_index = 0;
    player_set_radii(6, 12, 3);
    hitbox_set_hurtbox(6, 12, 6, 11);
    hitbox_set_attackbox();
}
else if (sequence_position(6)) image_index = 1;
else if (sequence_position(12)) image_index = 2;
else if (sequence_position(17)) sequence_moment = 0;
