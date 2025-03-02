/// seq_switch_spring_diagonal()

if (sequence_position(0))
{
    image_index = 0;
    hitbox_set_hurtbox(6, 6, 5, 5, -2, 3);
}
else if (sequence_position(1))
{
    image_index = 1;
    hitbox_set_hurtbox(6, 6, 4, 4, -3, 5);
}
else if (sequence_position(4))
{
    image_index = 2;
    hitbox_set_hurtbox(6, 6, 6, 7, 4, -4);
}
else if (sequence_position(7))
{
    image_index = 3;
    hitbox_set_hurtbox(6, 6, 6, 6);
}
else if (sequence_position(10))
{
    image_index = 4;
    hitbox_set_hurtbox(6, 6, 5, 5, 4, -3);
}
else if (sequence_position(13))
{
    image_index = 0;
    active = false;
    hitbox_set_hurtbox(6, 6, 5, 5, -2, 3);
    sequence_set(sequence_index);
}
