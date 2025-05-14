/// seq_miles_breathe()

if (sequence_position(0))
{
    sprite_index = spr_miles_breathe;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(6)) image_index = 1;