/// sequence_classic_run_0()

if (sequence_position(0))
{
    sprite_index = spr_classic_run_0;
    image_index = 0;
    player_set_radii(6, 12, 3);
    hitbox_set_hurtbox(6, 12, 6, 11);
    hitbox_set_attackbox();
}
else if (sequence_position(8)) image_index = 1;
else if (sequence_position(16)) image_index = 2;
else if (sequence_position(24)) image_index = 3;
else if (sequence_position(32)) image_index = 4;
else if (sequence_position(40)) image_index = 5;
else if (sequence_position(47)) sequence_moment = 0;