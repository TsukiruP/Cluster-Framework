/// seq_switch_vert_active()

if (sequence_position(0))
{
    image_index = 0;
    collision = false;
}
else if (sequence_position(3))
{
    image_index = 1;
    hitbox_set_hurtbox(9, 1, 9, 7);
}
else if (sequence_position(6))
{
    image_index = 2;
    hitbox_set_hurtbox(10, -3, 10, 8);
}
else if (sequence_position(9)) hitbox_set_hurtbox(9, -3, 9, 7);
else if (sequence_position(12)) image_index = 3;
else if (sequence_position(18)) image_index = 2;
else if (sequence_position(23)) sequence_moment = 12;
