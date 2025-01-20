/// sequence_classic_wait_leader()

if (sequence_position(0))
{
    sprite_index = spr_classic_wait;
    image_index = 0;
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}
else if (sequence_position(6)) image_index = 1;
else if (sequence_position(12)) image_index = 2;
else if (sequence_position(18)) image_index = 1;
else if (sequence_position(23)) sequence_moment = 0;
