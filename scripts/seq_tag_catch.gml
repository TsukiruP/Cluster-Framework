/// seq_tag_catch()

if (sequence_position(0))
{
    sprite_index = spr_tag;
    image_index = 0;
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(9)) instance_destroy();
