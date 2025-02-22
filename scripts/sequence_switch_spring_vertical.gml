/// sequence_switch_spring_vertical()

if (sequence_position(0))
{
    image_index = 0;
    hitbox_set_hurtbox(7, 7, 7, 12, 0, 3);
}
else if (sequence_position(1))
{
    image_index = 1;
    hitbox_set_hurtbox(7, 6, 7, 12, 0, 3);
}
else if (sequence_position(4))
{
    image_index = 2;
    hitbox_set_hurtbox(7, 21, 7, 12, 0, 3);
}
else if (sequence_position(7))
{
    image_index = 3;
    hitbox_set_hurtbox(7, 17, 7, 12, 0, 3);
}
else if (sequence_position(10))
{
    image_index = 4;
    hitbox_set_hurtbox(7, 20, 7, 12, 0, 3);
}
else if (sequence_position(13))
{
    image_index = 0;
    active = false;
    hitbox_set_hurtbox(7, 7, 7, 12, 0, 3);
    sequence_set(sequence_index);
}