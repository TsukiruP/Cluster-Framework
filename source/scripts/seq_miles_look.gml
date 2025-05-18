/// seq_miles_look()

if (sequence_position(0))
{
    sprite_index = spr_miles_look;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(4))
{
    image_index = 1;
    animation_trigger = true;
}
else if (sequence_position(8)) image_index = 2;
else if (sequence_position(18)) image_index = 3;
else if (sequence_position(28)) image_index = 4;
else if (sequence_position(38)) image_index = 5;
else if (sequence_position(47)) sequence_moment = 8;
