/// seq_sonic_ramp_fall()

if (sequence_position(0))
{
    sprite_index = spr_sonic_ramp;
    image_index = 4;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 14);
    hitbox_set_attackbox();
}
else if (sequence_position(2)) image_index = 5;
else if (sequence_position(4)) image_index = 6;
else if (sequence_position(6)) image_index = 7;
else if (sequence_position(8)) image_index = 8;
else if (sequence_position(10)) image_index = 9;
else if (sequence_position(12)) image_index = 10;
else if (sequence_position(14)) image_index = 11;
else if (sequence_position(15)) sequence_moment = 10;