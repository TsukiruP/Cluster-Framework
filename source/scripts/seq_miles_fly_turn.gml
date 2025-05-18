/// seq_miles_fly_turn()

if (sequence_position(0))
{
    sprite_index = spr_miles_fly_turn;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 10);
    hitbox_set_attackbox(17, 19, 17, -11);
}
else if (sequence_position(1)) image_index = 1;
else if (sequence_position(2)) player_set_animation("fly");
