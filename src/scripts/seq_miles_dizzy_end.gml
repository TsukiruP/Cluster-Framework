/// seq_miles_dizzy_end()

if (sequence_position(0))
{
    sprite_index = spr_miles_dizzy;
    image_index = 15;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(6)) image_index = 16;
else if (sequence_position(10)) image_index = 17;
else if (sequence_position(14)) image_index = 18;
else if (sequence_position(18)) image_index = 19;
else if (sequence_position(22)) image_index = 20;
else if (sequence_position(26)) image_index = 21;
else if (sequence_position(30)) image_index = 22;
else if (sequence_position(34)) image_index = 23;
else if (sequence_position(38)) image_index = 24;
else if (sequence_position(40)) animation_trigger = true;
