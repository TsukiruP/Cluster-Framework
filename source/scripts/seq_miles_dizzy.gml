/// seq_miles_dizzy()

if (sequence_position(0))
{
    sprite_index = spr_miles_dizzy;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(4)) image_index = 1;
else if (sequence_position(8)) image_index = 2;
else if (sequence_position(11)) image_index = 3;
else if (sequence_position(15)) image_index = 4;
else if (sequence_position(20)) image_index = 5;
else if (sequence_position(26)) image_index = 6;
else if (sequence_position(32)) image_index = 7;
else if (sequence_position(38)) image_index = 8;
else if (sequence_position(44)) image_index = 9;
else if (sequence_position(50)) image_index = 10;
else if (sequence_position(56)) image_index = 11;
else if (sequence_position(62)) image_index = 12;
else if (sequence_position(68)) image_index = 13;
else if (sequence_position(74)) image_index = 14;
else if (sequence_position(80)) image_index = 7;
else if (sequence_position(86)) image_index = 8;
else if (sequence_position(92)) image_index = 9;
else if (sequence_position(98)) image_index = 10;
else if (sequence_position(104)) image_index = 11;
else if (sequence_position(110)) image_index = 12;
else if (sequence_position(116)) image_index = 13;
else if (sequence_position(122)) player_set_animation("dizzy_end");
