/// seq_switch_hor_active()

if (sequence_position(0))
{
    image_index = 0;
    collision = false;
}
else if (sequence_position(3))
{
    image_index = 1;
    hitbox_set_hurtbox(8, 9, 1, 9);
}
else if (sequence_position(6))
{
    image_index = 2;
    hitbox_set_hurtbox(8, 9, -3, 9);
}
else if (sequence_position(12)) image_index = 3;
else if (sequence_position(18)) image_index = 2;
else if (sequence_position(23)) sequence_moment = 12;