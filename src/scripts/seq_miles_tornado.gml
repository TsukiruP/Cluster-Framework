/// seq_miles_tornado()

if (sequence_position(0))
{
    sprite_index = spr_miles_tornado;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(9)) image_index = 3;
else if (sequence_position(12)) image_index = 4;
else if (sequence_position(13)) image_index = 5;
else if (sequence_position(14))
{
    image_index = 6;
    animation_trigger = false;
    hitbox_set_hurtbox(9, 22, 5, 6);
    hitbox_set_attackbox(23, 23, 23, 9);
}
else if (sequence_position(16)) image_index = 7;
else if (sequence_position(18)) image_index = 8;
else if (sequence_position(20)) image_index = 9;
else if (sequence_position(22)) image_index = 10;
else if (sequence_position(24)) image_index = 11;
else if (sequence_position(26)) image_index = 12;
else if (sequence_position(28)) image_index = 13;
else if (sequence_position(29))
{
    animation_trigger = true;
    sequence_moment = 14;
}
