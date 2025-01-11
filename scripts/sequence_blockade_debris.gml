/// sequence_blockade_debris()

if (sequence_position(0))
{
    sprite_index = spr_blockade_debris
    image_index = irandom(sprite_get_number(sprite_index));
}

else if (sequence_position(30))
{
    instance_destroy();
}
