/// sequence_spring_vertical()

if (sequence_position(0))
{
    image_index = 1;
    hurtbox_set(5, 2, 5, 15);
}
else if (sequence_position(2))
{
    image_index = 2;
    hurtbox_set(5, 17, 5, 15);
}
else if (sequence_position(6))
{
    image_index = 3;
    hurtbox_set(5, 13, 5, 15);
}
else if (sequence_position(8))
{
    image_index = 4;
    hurtbox_set(5, 16, 5, 15);
}
else if (sequence_position(12))
{
    image_index = 5;
    hurtbox_set(5, 13, 5, 15);
}
else if (sequence_position(14))
{
    hurtbox_set(5, 4, 5, 15);
    activated = false;
}
