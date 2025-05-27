/// seq_sonic_leap_fall()

if (sequence_position(0))
{
    sprite_index = spr_sonic_leap_jump;
    image_index = 3;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 20, 6, 10);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 4;
else if (sequence_position(6)) image_index = 5;
else if (sequence_position(9)) image_index = 6;
else if (sequence_position(12)) image_index = 7;
else if (sequence_position(15)) image_index = 8;
else if (sequence_position(18)) image_index = 9;
else if (sequence_position(21)) image_index = 10;
else if (sequence_position(23)) sequence_moment = 15;
