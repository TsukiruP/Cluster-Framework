/// seq_miles_omochao()

if (sequence_position(0))
{
    sprite_index = spr_miles_omochao;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(18)) image_index = 3;
else if (sequence_position(22)) image_index = 4;
else if (sequence_position(26)) image_index = 5;
else if (sequence_position(30)) image_index = 6;
else if (sequence_position(34)) image_index = 7;
else if (sequence_position(40)) image_index = 8;
else if (sequence_position(46)) image_index = 9;
else if (sequence_position(52)) image_index = 10;
else if (sequence_position(58)) image_index = 11;
else if (sequence_position(64)) image_index = 12;
else if (sequence_position(70)) image_index = 13;
else if (sequence_position(76)) image_index = 14;
else if (sequence_position(82)) image_index = 15;
else if (sequence_position(88)) image_index = 16;
else if (sequence_position(94)) image_index = 17;
else if (sequence_position(100)) image_index = 18;
else if (sequence_position(106)) image_index = 19;
else if (sequence_position(112)) image_index = 20;
else if (sequence_position(118)) image_index = 21;
else if (sequence_position(124)) image_index = 22;
else if (sequence_position(129)) sequence_moment = 34;