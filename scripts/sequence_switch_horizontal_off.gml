/// sequence_switch_horizontal_off()

if (sequence_position(0))
{
    image_index = 2;
    hitbox_set_hurtbox(3, 9, 2, 9, -5);
}
else if (sequence_position(6))
{
    image_index = 4;
    hitbox_set_hurtbox(3, 9, 6, 9, -5);
}
else if (sequence_position(12))
{
    collision = true;
    active = false;
    hitbox_set_hurtbox(7, 9, 6, 9);
}
