/// sequence_sonic_run_4()

if (sequence_position(0))
{
    sprite_index = spr_sonic_run_4;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 15);
    hitbox_set_attackbox();
}
else if (sequence_position(8)) image_index = 1;
else if (sequence_position(16)) image_index = 2;
else if (sequence_position(24)) image_index = 3;
else if (sequence_position(32)) image_index = 4;
else if (sequence_position(40)) image_index = 5;
else if (sequence_position(48)) image_index = 6;
else if (sequence_position(56)) image_index = 7;
else if (sequence_position(63)) sequence_moment = 0;