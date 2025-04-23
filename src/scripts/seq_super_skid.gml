/// seq_super_skid()

if (sequence_position(0))
{
    sprite_index = spr_super_skid;
    image_index = 0;
}
else if (sequence_position(1)) image_index = 1;
else if (sequence_position(2))
{
    image_index = 2;
    sequence_moment = 0;
}
