/// seq_spring_vertical()

if (sequence_position(0))
{
    image_index = 1;
    hitbox_set_hurtbox(5, 2, 5, 15);
}
else if (sequence_position(2))
{
    image_index = 2;
    hitbox_set_hurtbox(5, 17, 5, 15);
}
else if (sequence_position(6))
{
    image_index = 3;
    hitbox_set_hurtbox(5, 13, 5, 15);
}
else if (sequence_position(8))
{
    image_index = 4;
    hitbox_set_hurtbox(5, 16, 5, 15);
}
else if (sequence_position(12))
{
    image_index = 5;
    hitbox_set_hurtbox(5, 13, 5, 15);
}
else if (sequence_position(14))
{
    image_index = 0;
    active = false;
    hitbox_set_hurtbox(5, 4, 5, 15);
    sequence_set(sequence_index);
}
