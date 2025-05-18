/// seq_miles_ramp_fall()

if (sequence_position(0))
{
    sprite_index = spr_miles_ramp;
    image_index = 4;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 12);
    hitbox_set_attackbox();
}
else if (sequence_position(1)) image_index = 5;
else if (sequence_position(3)) image_index = 6;
else if (sequence_position(5)) image_index = 7;
else if (sequence_position(7)) image_index = 8;
else if (sequence_position(9)) image_index = 9;
else if (sequence_position(11)) image_index = 10;
else if (sequence_position(13)) image_index = 11;
else if (sequence_position(15)) image_index = 12;
else if (sequence_position(16)) sequence_moment = 11;
