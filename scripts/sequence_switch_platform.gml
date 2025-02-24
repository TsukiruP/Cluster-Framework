/// sequence_switch_platform()

if (sequence_position(0)) image_index = 1;
else if (sequence_position(2)) image_index = 2;
else if (sequence_position(4)) image_index = 3;
else if (sequence_position(6)) image_index = 4;
else if (sequence_position(8))
{
    image_index = 0;
    collision = true;
}
