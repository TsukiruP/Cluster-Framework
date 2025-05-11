/// seq_miles_tornado_end()

if (sequence_position(0))
{
    sprite_index = spr_miles_tornado;
    image_index = 14;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(2)) image_index = 15;
else if (sequence_position(4)) image_index = 16;
else if (sequence_position(7)) image_index = 17;
else if (sequence_position(10)) image_index = 18;
else if (sequence_position(13)) animation_trigger = true;
