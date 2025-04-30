/// seq_miles_spin_fall()

if (sequence_position(0))
{
    sprite_index = spr_miles_spin_fall;
    image_index = 0;
    player_set_radii(6, 9, 3);
    hitbox_set_hurtbox(6, 20, 6, 2);
    hitbox_set_attackbox(10, 12, 10, 8);
}
else if (sequence_position(1))
{
    image_index = 1;
    hitbox_set_hurtbox(6, 22, 8, 0);
    hitbox_set_attackbox(9, 13, 9, 5);
}
else if (sequence_position(3)) image_index = 2;
else if (sequence_position(5)) image_index = 3;
else if (sequence_position(7)) image_index = 4;
else if (sequence_position(9)) image_index = 5;
else if (sequence_position(10)) sequence_moment = 5;
