/// seq_miles_ramp_flight()

if (sequence_position(0))
{
    sprite_index = spr_miles_ramp;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(1))
{
    image_index = 1;
    hitbox_set_hurtbox(6, 10, 6, 12);
}
else if (sequence_position(3)) image_index = 2;
else if (sequence_position(5)) image_index = 3;
else if (sequence_position(6)) sequence_moment = 1;