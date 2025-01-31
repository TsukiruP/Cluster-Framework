/// sequence_sonic_stomp_land()

if (sequence_position(0))
{
    sprite_index = spr_sonic_stomp;
    image_index = 8;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 15);
    hitbox_set_attackbox();
}
else if (sequence_position(5)) image_index = 9;
else if (sequence_position(9)) image_index = 10;
else if (sequence_position(13)) image_index = 11;
else if (sequence_position(16)) animation_finished = true;
