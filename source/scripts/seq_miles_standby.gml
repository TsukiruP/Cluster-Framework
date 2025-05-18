/// seq_miles_standby()

if (sequence_position(0))
{
    sprite_index = spr_miles_standby;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(6)) image_index = 1;
else if (sequence_position(10)) image_index = 2;
else if (sequence_position(14)) image_index = 3;
else if (sequence_position(18)) image_index = 4;
else if (sequence_position(24)) image_index = 5;
else if (sequence_position(28)) image_index = 6;
else if (sequence_position(32)) image_index = 7;
else if (sequence_position(36)) image_index = 8;
else if (sequence_position(42)) image_index = 9;
else if (sequence_position(46)) image_index = 10;
else if (sequence_position(50)) image_index = 11;
else if (sequence_position(54)) image_index = 12;
else if (sequence_position(60)) image_index = 13;
else if (sequence_position(64)) image_index = 14;
else if (sequence_position(70)) image_index = 15;
else if (sequence_position(74)) image_index = 16;
else if (sequence_position(78)) image_index = 17;
else if (sequence_position(86)) image_index = 18;
else if (sequence_position(92)) image_index = 19;
else if (sequence_position(98)) image_index = 20;
else if (sequence_position(104)) image_index = 21;
else if (sequence_position(112)) image_index = 22;
else if (sequence_position(116)) image_index = 23;
else if (sequence_position(120)) image_index = 24;
else if (sequence_position(124)) image_index = 25;
else if (sequence_position(130)) image_index = 26;
else if (sequence_position(134)) image_index = 27;
else if (sequence_position(150)) image_index = 28;
else if (sequence_position(152)) image_index = 29;
else if (sequence_position(156)) image_index = 30;
else if (sequence_position(160)) image_index = 31;
else if (sequence_position(164)) image_index = 32;
else if (sequence_position(168)) image_index = 33;
else if (sequence_position(172)) image_index = 34;
else if (sequence_position(175)) player_set_animation("stand");
