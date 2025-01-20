/// sequence_classic_push()

if (sequence_position(0))
{
    sprite_index = spr_classic_push;
    image_index = 0;
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}
else if (sequence_position(8)) image_index = 1;
else if (sequence_position(16)) image_index = 2;
else if (sequence_position(24)) image_index = 3;
else if (sequence_position(31)) sequence_moment = 0;
