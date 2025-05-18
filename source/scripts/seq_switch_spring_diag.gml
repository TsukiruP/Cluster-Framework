/// seq_switch_spring_diag()

if (sequence_position(0))
{
    image_index = 0;
    hitbox_set_hurtbox(8, 3, 3, 8);
}
else if (sequence_position(1))
{
    image_index = 1;
    hitbox_set_hurtbox(9, 1, 1, 9);
}
else if (sequence_position(4))
{
    image_index = 2;
    hitbox_set_hurtbox(2, 10, 10, 1);
}
else if (sequence_position(7))
{
    image_index = 3;
    hitbox_set_hurtbox(6, 6, 6, 6);
}
else if (sequence_position(10))
{
    image_index = 4;
    hitbox_set_hurtbox(2, 7, 7, 2);
}
else if (sequence_position(13))
{
    image_index = 0;
    active = false;
    hitbox_set_hurtbox(8, 3, 3, 8);
    sequence_set(sequence_index);
}
