/// seq_switch_spring_hor()

if (sequence_position(0))
{
    image_index = 0;
    hitbox_set_hurtbox(16, 7, 4, 7);
}
else if (sequence_position(1))
{
    image_index = 1;
    hitbox_set_hurtbox(16, 7, 3, 7);
}
else if (sequence_position(4))
{
    image_index = 2;
    hitbox_set_hurtbox(16, 7, 17, 7);
}
else if (sequence_position(7))
{
    image_index = 3;
    hitbox_set_hurtbox(16, 7, 14, 7);
}
else if (sequence_position(10))
{
    image_index = 4;
    hitbox_set_hurtbox(16, 7, 17, 7);
}
else if (sequence_position(13))
{
    image_index = 0;
    active = false;
    hitbox_set_hurtbox(16, 7, 4, 7);
    sequence_set(sequence_index);
}