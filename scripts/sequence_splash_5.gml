/// sequence_splash_5()

if (sequence_position(0))
{
    sprite_index = spr_splash_5;
    image_index = 0;
}
else if (sequence_position(2))
{
    image_index = 1;
}
else if (sequence_position(4))
{
    image_index = 2;
}
else if (sequence_position(5))
{
    sequence_moment = 0;
}
