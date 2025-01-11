/// sequence_checkpoint_inactive()

if (sequence_position(0))
{
    sprite_index = spr_checkpoint;
    image_index = 0;
}
else if (sequence_position(6))
{
    image_index = 1;
}
else if (sequence_position(12))
{
    image_index = 2;
}
else if (sequence_position(18))
{
    image_index = 3;
}
else if (sequence_position(24))
{
    image_index = 4;
}
else if (sequence_position(30))
{
    image_index = 5;
}
else if (sequence_position(35))
{
    sequence_moment = 0;
}
