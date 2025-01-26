/// sequence_sonic_ramp_flight()

if (sequence_position(0))
{
    sprite_index = spr_sonic_ramp;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 13, 6, 15);
    hitbox_set();
}
else if (sequence_position(2)) image_index = 1;
else if (sequence_position(4)) image_index = 2;
else if (sequence_position(6)) image_index = 3;
else if (sequence_position(7)) sequence_moment = 2;
