/// seq_miles_insta()

if (sequence_position(0))
{
    sprite_index = spr_miles_insta;
    image_index = 0;
    player_set_radii(6, 9, 3, 5);
    hitbox_set_hurtbox(6, 6, 8, 9);
    hitbox_set_attackbox(11, 12, 12, 11);
}
else if (sequence_position(1)) image_index = 1;
else if (sequence_position(2)) image_index = 2;
else if (sequence_position(3)) image_index = 3;
else if (sequence_position(4)) image_index = 4;
else if (sequence_position(5)) image_index = 5;
else if (sequence_position(6)) image_index = 6;
else if (sequence_position(7)) image_index = 7;
else if (sequence_position(8))
{
    animation_skip = true;
    player_set_animation("spin_flight");
}
