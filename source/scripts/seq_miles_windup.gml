/// seq_miles_windup()

if (sequence_position(0))
{
    sprite_index = spr_miles_tornado;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(9)) image_index = 3;
else if (sequence_position(12)) image_index = 4;
else if (sequence_position(13)) image_index = 5;
else if (sequence_position(14)) player_set_animation("tornado");
