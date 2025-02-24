/// sequence_reticle_colors()

if (sequence_position(0))
{
    sprite_index = spr_reticle_colors;
    image_index = 0;
}
else if (sequence_position(1)) image_index = 1;
else if (sequence_position(2)) image_index = 2;
else if (sequence_position(3)) image_index = 3;
else if (sequence_position(4)) image_index = 4;
else if (sequence_position(5)) image_index = 5;
else if (sequence_position(6)) image_index = 6;
else if (sequence_position(7)) image_index = 7;
else if (sequence_position(8)) image_index = 8;
else if (sequence_position(9)) image_index = 9;
