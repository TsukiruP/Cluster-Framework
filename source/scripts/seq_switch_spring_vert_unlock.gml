/// seq_switch_spring_vert_unlock()

if (sequence_position(0))
{
    image_index = 5;
    hitbox_set_hurtbox(7, -3, 7, 16);
}
else if (sequence_position(3))
{
    image_index = 6;
    hitbox_set_hurtbox(7, 9, 7, 16);
}
else if (sequence_position(6))
{
    image_index = 7;
    hitbox_set_hurtbox(7, 3, 7, 16);
}
else if (sequence_position(9))
{
    image_index = 8;
    hitbox_set_hurtbox(7, 4, 7, 16);
}
else if (sequence_position(12))
{
    image_index = 9;
    hitbox_set_hurtbox(7, 3, 7, 16);
}
else if (sequence_position(15))
{
    image_index = 0;
    hitbox_set_hurtbox(7, 4, 7, 16);
}
else if (sequence_position(18))
{
    collision = true;
    sequence_set(seq_switch_spring_vert);
}
