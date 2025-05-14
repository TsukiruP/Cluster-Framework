/// seq_switch_spring_hor_lock()

if (sequence_position(0))
{
    image_index = 0;
    collision = false;
    hitbox_set_hurtbox(16, 7, 4, 7);
}
else if (sequence_position(3))
{
    image_index = 1;
    hitbox_set_hurtbox(16, 7, 3, 7);
}
else if (sequence_position(6))
{
    image_index = 5;
    hitbox_set_hurtbox(16, 7, -3, 7);
}