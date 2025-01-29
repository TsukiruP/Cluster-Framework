/// sequence_sonic_rail()

if (sequence_position(0))
{
    sprite_index = spr_sonic_rail;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 12, 6, 18);
    hitbox_set();
}
else if (sequence_position(2)) image_index = 1;
else if (sequence_position(3)) sequence_moment = 0;
