/// seq_switch_hor_inactive()

if (sequence_position(0))
{
    image_index = 2;
    hitbox_set_hurtbox(8, 9, -3, 9);
}
else if (sequence_position(6))
{
    image_index = 4;
    hitbox_set_hurtbox(8, 9, 1, 9);
}
else if (sequence_position(12))
{
    image_index = 0;
    collision = true;
    hitbox_set_hurtbox(8, 9, 6, 9);
}
