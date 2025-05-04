/// seq_miles_swim_drop()

if (sequence_position(0))
{
    sprite_index = spr_miles_swim;
    image_index = 9;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 10);
    hitbox_set_attackbox();
}
else if (sequence_position(8)) image_index = 10;
else if (sequence_position(16)) image_index = 11;
else if (sequence_position(24)) image_index = 12;
else if (sequence_position(32)) image_index = 13;
else if (sequence_position(40)) image_index = 14;
else if (sequence_position(48)) image_index = 15;
else if (sequence_position(56)) image_index = 16;
else if (sequence_position(64)) image_index = 17;
else if (sequence_position(71)) sequence_moment = 8;
