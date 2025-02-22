/// sequence_switch_spring_diagonal_lock()

if (sequence_position(0))
{
    image_index = 0;
    collision = false;
    hitbox_set_hurtbox(6, 6, 5, 5, -2, 3);
}
else if (sequence_position(3))
{
    image_index = 1;
    hitbox_set_hurtbox(6, 6, 4, 4, -3, 5);
}
else if (sequence_position(6))
{
    image_index = 5;
    hitbox_set_hurtbox(6, 6, 6, 6, -7, 7);
}