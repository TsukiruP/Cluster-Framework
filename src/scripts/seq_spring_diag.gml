/// seq_spring_diag()

if (sequence_position(0))
{
    image_index = 1;
    hitbox_set_hurtbox(10, -1, 0, 11);
}
else if (sequence_position(2))
{
    image_index = 2;
    hitbox_set_hurtbox(-1, 10, 11, 0);
}
else if (sequence_position(6))
{
    image_index = 3;
    hitbox_set_hurtbox(3, 6, 7, 4);
}
else if (sequence_position(8))
{
    image_index = 4;
    hitbox_set_hurtbox(0, 9, 10, 1);
}
else if (sequence_position(12))
{
    image_index = 5;
    hitbox_set_hurtbox(3, 6, 7, 4);
}
else if (sequence_position(14))
{
    image_index = 0;
    active = false;
    hitbox_set_hurtbox(6, 2, 4, 8);
    sequence_set(sequence_index);
}