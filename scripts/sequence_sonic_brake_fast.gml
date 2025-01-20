/// sequence_sonic_brake_fast()

if (sequence_position(0))
{
    sprite_index = spr_sonic_brake_fast;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 13, 6, 15);
    hitbox_set();
}
else if (sequence_position(1)) image_index = 1;
else if (sequence_position(2)) image_index = 2;
else if (sequence_position(5)) image_index = 3;
else if (sequence_position(7)) sequence_moment = 2;
