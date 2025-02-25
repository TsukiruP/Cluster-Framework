/// sequence_bound_jump()

if (sequence_position(0))
{
    sprite_index = spr_bound_jump;
    image_index = 0;
}
else if (sequence_position(1)) image_index = 1;
else if (sequence_position(2)) instance_destroy();
