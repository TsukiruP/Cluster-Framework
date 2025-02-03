/// sequence_shield_bubble_recoil()

if (sequence_position(0))
{
    sprite_index = spr_shield_bubble_bound;
    image_index = 1;
}
else if (sequence_position(12)) image_index = 0;
else if (sequence_position(17)) sequence_set(sequence_shield_bubble);
