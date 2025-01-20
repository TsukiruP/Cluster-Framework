/// sequence_ring_sparkle()

if (sequence_position(0))
{
    sprite_index = spr_ring_sparkle;
    image_index = 0;
}
else if (sequence_position(4)) image_index = 1;
else if (sequence_position(8)) image_index = 2;
else if (sequence_position(12)) image_index = 3;
else if (sequence_position(16)) instance_destroy();
