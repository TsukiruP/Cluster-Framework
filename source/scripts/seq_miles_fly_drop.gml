/// seq_miles_fly_drop()

if (sequence_position(0))
{
    sprite_index = spr_miles_fly;
    image_index = 16;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 10);
    hitbox_set_attackbox();
}
else if (sequence_position(6)) image_index = 17;
else if (sequence_position(10)) image_index = 18;
else if (sequence_position(16)) image_index = 19;
else if (sequence_position(22)) image_index = 20;
else if (sequence_position(28)) image_index = 21;
else if (sequence_position(34)) image_index = 22;
else if (sequence_position(40)) image_index = 23;
else if (sequence_position(46)) image_index = 24;
else if (sequence_position(52)) image_index = 25;
else if (sequence_position(57)) sequence_moment = 10;