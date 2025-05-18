/// seq_goal_ring_clear()

if (sequence_position(0))
{
    sprite_index = spr_goal_ring;
    image_index = 0;
}
else if (sequence_position(6)) image_index = 1;
else if (sequence_position(12)) image_index = 2;
else if (sequence_position(18)) image_index = 3;
else if (sequence_position(24)) image_index = 4;
else if (sequence_position(30)) image_index = 5;
else if (sequence_position(36)) image_index = 6;
else if (sequence_position(42)) image_index = 7;
else if (sequence_position(48)) image_index = 8;
else if (sequence_position(54)) image_index = 9;
else if (sequence_position(60)) image_index = 10;
