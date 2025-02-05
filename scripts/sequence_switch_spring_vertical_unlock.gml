/// sequence_switch_spring_vertical_unlock()

if (sequence_position(3))
{
    image_index = 1;
    hitbox_set_hurtbox();
}
else if (sequence_position(6))
{
    image_index = 2;
}
else if (sequence_position(9))
{
    image_index = 3;
}
else if (sequence_position(12))
{
    image_index = 4;
}
else if (sequence_position(15))
{
    image_index = 5;
}
