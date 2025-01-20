/// sequence_sonic_stand()

if (sequence_position(0))
{
    sprite_index = spr_sonic_stand;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
    hitbox_set();
}
else if (sequence_position(6)) image_index = 1;
else if (sequence_position(12)) image_index = 2;
else if (sequence_position(18)) image_index = 3;
else if (sequence_position(24)) image_index = 4;
else if (sequence_position(30)) image_index = 5;
else if (sequence_position(36)) image_index = 6;
else if (sequence_position(42)) image_index = 7;
else if (sequence_position(48)) image_index = 0;
else if (sequence_position(54)) image_index = 8;
else if (sequence_position(60)) image_index = 9;
else if (sequence_position(66)) image_index = 10;
else if (sequence_position(72)) image_index = 4;
else if (sequence_position(78)) image_index = 5;
else if (sequence_position(84)) image_index = 6;
else if (sequence_position(90)) image_index = 7;
else if (sequence_position(96)) image_index = 0;
else if (sequence_position(102)) image_index = 1;
else if (sequence_position(108)) image_index = 2;
else if (sequence_position(114)) image_index = 3;
else if (sequence_position(120)) image_index = 4;
else if (sequence_position(126)) image_index = 5;
else if (sequence_position(132)) image_index = 6;
else if (sequence_position(138)) image_index = 7;
else if (sequence_position(144)) image_index = 11;
else if (sequence_position(150)) image_index = 12;
else if (sequence_position(162)) image_index = 13;
else if (sequence_position(168)) image_index = 14;
else if (sequence_position(174)) image_index = 15;
else if (sequence_position(180)) image_index = 16;
else if (sequence_position(192)) image_index = 17;
else if (sequence_position(200)) image_index = 0;
else if (sequence_position(206)) image_index = 5;
else if (sequence_position(212)) image_index = 6;
else if (sequence_position(218)) image_index = 7;
else if (sequence_position(223)) sequence_moment = 0;
