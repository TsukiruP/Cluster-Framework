/// seq_sonic_look_end()

if (sequence_position(0))
{
    sprite_index = spr_sonic_look;
    image_index = 1;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 13, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(2)) image_index = 0;
else if (sequence_position(4)) player_set_animation("stand");
