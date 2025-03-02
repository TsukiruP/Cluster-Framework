/// seq_switch_vertical_off()

if (sequence_position(0))
{
    image_index = 2;
    hitbox_set_hurtbox(9, 2, 9, 2, 0, 5);
}
else if (sequence_position(6))
{
    image_index = 4;
    hitbox_set_hurtbox(9, 8, 9, 7);
}
else if (sequence_position(12))
{
    image_index = 0;
    collision = true;
    hitbox_set_hurtbox(9, 6, 9, 7);
}
