/// seq_switch_spring_diag_lock()

if (sequence_position(0))
{
    image_index = 0;
    collision = false;
    hitbox_set_hurtbox(8, 3, 3, 8);
}
else if (sequence_position(3))
{
    image_index = 1;
    hitbox_set_hurtbox(9, 1, 1, 9);
}
else if (sequence_position(6))
{
    image_index = 5;
    hitbox_set_hurtbox(13, -1, -1, 13);
}