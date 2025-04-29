/// seq_miles_run_4()

if (sequence_position(0))
{
    sprite_index = spr_miles_run_4;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 15);
    hitbox_set_attackbox();
}
else if (sequence_position(8)) image_index = 1;
else if (sequence_position(16)) image_index = 2;
else if (sequence_position(24)) image_index = 3;
else if (sequence_position(32)) image_index = 4;
else if (sequence_position(40)) image_index = 5;
else if (sequence_position(48)) image_index = 6;
else if (sequence_position(56)) image_index = 7;
else if (sequence_position(64)) image_index = 8;
else if (sequence_position(72)) image_index = 9;
else if (sequence_position(80)) image_index = 10;
else if (sequence_position(88)) image_index = 11;
else if (sequence_position(96)) image_index = 12;
else if (sequence_position(104)) image_index = 13;
else if (sequence_position(112)) image_index = 14;
else if (sequence_position(120)) image_index = 15;
else if (sequence_position(127)) sequence_moment = 0;
