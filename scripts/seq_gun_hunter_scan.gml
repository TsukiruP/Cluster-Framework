/// seq_gun_hunter_scan()

if (sequence_position(0))
{
    sprite_index = spr_gun_hunter;
    image_index = 7;
}
else if (sequence_position(8)) image_index = 8;
else if (sequence_position(16)) image_index = 6;
else if (sequence_position(36)) image_index = 8;
else if (sequence_position(44)) image_index = 9;
else if (sequence_position(52)) image_index = 10;
else if (sequence_position(72)) image_index = 11;
else if (sequence_position(79))
{
    scan_count += 1;
    sequence_moment = 0;
}
