/// seq_miles_trick_back_fall()

if (sequence_position(0))
{
    sprite_index = spr_miles_trick_back;
    image_index = 11;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 12, 6, 10);
    hitbox_set_attackbox();
}
else if (sequence_position(4)) image_index = 12;
else if (sequence_position(8)) image_index = 13;
else if (sequence_position(12)) image_index = 14;
else if (sequence_position(16)) image_index = 15;
else if (sequence_position(19)) image_index = 16;
else if (sequence_position(22)) image_index = 17;
else if (sequence_position(25)) image_index = 18;
else if (sequence_position(28)) image_index = 19;
else if (sequence_position(31)) image_index = 20;
else if (sequence_position(33)) sequence_moment = 25;
