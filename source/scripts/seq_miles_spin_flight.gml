/// seq_miles_spin_flight()

if (animation_skip)
{
    sprite_index = spr_miles_spin_flight;
    sequence_skip(6);
}

if (sequence_position(0))
{
    sprite_index = spr_miles_spin_flight;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 18, 6, 4);
    hitbox_set_attackbox(6, 18, 6, 4);
}
else if (sequence_position(3))
{
    image_index = 1;
    hitbox_set_hurtbox(5, 6, 7, 16);
    hitbox_set_attackbox(5, 6, 7, 16);
}
else if (sequence_position(6))
{
    image_index = 2;
    player_set_radii(6, 9, 3, 5);
    hitbox_set_hurtbox(8, 8, 8, 8);
    hitbox_set_attackbox(8, 8, 8, 8);
}
else if (sequence_position(8)) image_index = 3;
else if (sequence_position(10)) image_index = 4;
else if (sequence_position(12)) image_index = 5;
else if (sequence_position(14))
{
    sprite_index = spr_miles_roll;
    image_index = 0;
}
else if (sequence_position(16)) image_index = 1;
else if (sequence_position(18)) image_index = 2;
else if (sequence_position(20)) image_index = 3;
else if (sequence_position(22))
{
    sprite_index = spr_miles_spin_flight;
    image_index = 2;
}
else if (sequence_position(23)) sequence_moment = 8;
