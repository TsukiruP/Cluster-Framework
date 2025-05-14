/// seq_miles_trick_up_fall()

if (sequence_position(0))
{
    sprite_index = spr_miles_trick_up;
    image_index = 9;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 12, 6, 10);
    hitbox_set_attackbox();
}
else if (sequence_position(2)) image_index = 10;
else if (sequence_position(6)) image_index = 11;
else if (sequence_position(10)) image_index = 12;
else if (sequence_position(13)) image_index = 13;
else if (sequence_position(16)) image_index = 14;
else if (sequence_position(18)) sequence_moment = 10;
