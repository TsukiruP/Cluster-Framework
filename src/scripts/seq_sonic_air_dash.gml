/// seq_sonic_air_dash()

if (animation_skip)
{
    sprite_index = spr_sonic_air_dash;
    sequence_skip(8);
}

if (sequence_position(0))
{
    sprite_index = spr_sonic_air_dash;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(8, 12, 4, 19);
    hitbox_set_attackbox();
}
else if (sequence_position(2)) image_index = 1;
else if (sequence_position(4)) image_index = 2;
else if (sequence_position(6)) image_index = 3;
else if (sequence_position(8))
{
    image_index = 4;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(8, 13, 6, 17);
    hitbox_set_attackbox();
}
else if (sequence_position(10)) image_index = 5;
else if (sequence_position(12)) image_index = 6;
else if (sequence_position(13)) sequence_moment = 8;