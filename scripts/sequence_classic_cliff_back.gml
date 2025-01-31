/// sequence_classic_cliff_back()

if (sequence_position(0))
{
    sprite_index = spr_classic_cliff;
    image_index = 3;
    player_set_radii(6, 12, 3);
    hitbox_set_hurtbox(6, 12, 6, 11);
    hitbox_set_attackbox();
}
else if (sequence_position(8)) image_index = 4;
else if (sequence_position(16)) image_index = 5;
else if (sequence_position(23)) sequence_moment = 0;
