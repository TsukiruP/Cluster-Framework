/// seq_gun_hunter_shoot()

if (sequence_position(0))
{
    sprite_index = spr_gun_hunter;
    image_index = 7;
}
else if (sequence_position(8)) image_index = 12;
else if (sequence_position(12)) image_index = 13;
else if (sequence_position(14)) image_index = 14;
else if (sequence_position(20)) image_index = 15;
else if (sequence_position(22)) image_index = 16;
else if (sequence_position(24)) image_index = 17;
else if (sequence_position(44)) image_index = 18;
else if (sequence_position(46)) image_index = 17;
else if (sequence_position(48)) image_index = 18;
else if (sequence_position(50)) image_index = 17;
else if (sequence_position(52)) image_index = 18;
else if (sequence_position(54)) image_index = 17;
else if (sequence_position(74)) image_index = 19;
else if (sequence_position(76)) image_index = 7;
else if (sequence_position(77)) sequence_set(seq_gun_hunter_move);
