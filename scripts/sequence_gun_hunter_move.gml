/// sequence_gun_hunter_move()

if (sequence_position(0))
{
    sprite_index = spr_gun_hunter;
    image_index = 0;
}
else if (sequence_position(8)) image_index = 1;
else if (sequence_position(16)) image_index = 2;
else if (sequence_position(24)) image_index = 3;
else if (sequence_position(32)) image_index = 4;
else if (sequence_position(40)) image_index = 5;
else if (sequence_position(47)) sequence_moment = 0;
