/// seq_miles_tornado()

if (sequence_position(0))
{
    sprite_index = spr_miles_tornado;
    image_index = 6;
    animation_trigger = false;
    hitbox_set_hurtbox(9, 22, 5, 6);
    hitbox_set_attackbox(23, 23, 23, 9);
}
else if (sequence_position(2)) image_index = 7;
else if (sequence_position(4)) image_index = 8;
else if (sequence_position(6)) image_index = 9;
else if (sequence_position(8)) image_index = 10;
else if (sequence_position(10)) image_index = 11;
else if (sequence_position(12)) image_index = 12;
else if (sequence_position(14)) image_index = 13;
else if (sequence_position(15))
{
    animation_trigger = true;
    sequence_moment = 0;
}
