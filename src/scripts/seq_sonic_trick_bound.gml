/// seq_sonic_trick_bound()

if (sequence_position(0))
{
    sprite_index = spr_sonic_trick_down;
    image_index = 8;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 14);
    hitbox_set_attackbox();
}
else if (sequence_position(2)) image_index = 9;
else if (sequence_position(4)) image_index = 10;
else if (sequence_position(6)) image_index = 11;
else if (sequence_position(8)) image_index = 12;
else if (sequence_position(11)) image_index = 13;
else if (sequence_position(14)) image_index = 14;
else if (sequence_position(16)) sequence_moment = 8;