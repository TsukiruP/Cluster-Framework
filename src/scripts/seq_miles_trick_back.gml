/// seq_miles_trick_back()

if (sequence_position(0))
{
    sprite_index = spr_miles_trick_back;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 12, 6, 10);
    hitbox_set_attackbox();
}
else if (sequence_position(2)) image_index = 1;
else if (sequence_position(4)) image_index = 2;
else if (sequence_position(6))
{
    image_index = 3;
    animation_trigger = true;
}
else if (sequence_position(10)) image_index = 4;
else if (sequence_position(12)) image_index = 5;
else if (sequence_position(14)) image_index = 6;
else if (sequence_position(16))
{
    image_index = 7;
    hitbox_set_attackbox(14, 0, 23, 10);
}
else if (sequence_position(19)) image_index = 8;
else if (sequence_position(22)) image_index = 9;
else if (sequence_position(25)) image_index = 10;
else if (sequence_position(27)) sequence_moment = 16;