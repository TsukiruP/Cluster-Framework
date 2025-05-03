/// seq_sonic_trick_up_fall()

if (sequence_position(0))
{
    sprite_index = spr_sonic_trick_up;
    image_index = 8;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 14);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 9;
else if (sequence_position(6)) image_index = 10;
else if (sequence_position(9)) image_index = 11;
else if (sequence_position(11)) image_index = 12;
else if (sequence_position(13)) image_index = 13;
else if (sequence_position(14)) sequence_moment = 11;