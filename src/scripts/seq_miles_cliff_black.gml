/// seq_miles_cliff_black()

if (sequence_position(0))
{
    sprite_index = spr_miles_cliff_back;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(4)) image_index = 1;
else if (sequence_position(8)) image_index = 2;
else if (sequence_position(12)) image_index = 3;
else if (sequence_position(16)) image_index = 4;
else if (sequence_position(20)) image_index = 5;
else if (sequence_position(24)) image_index = 6;
else if (sequence_position(28)) image_index = 7;
else if (sequence_position(31)) sequence_moment = 0;
