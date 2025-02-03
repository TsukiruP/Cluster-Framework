/// sequence_sonic_cliff_front()

if (sequence_position(0))
{
    sprite_index = spr_sonic_cliff_front;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 13, 6, 15);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(9)) image_index = 3;
else if (sequence_position(12)) image_index = 4;
else if (sequence_position(15)) image_index = 5;
else if (sequence_position(18)) image_index = 6;
else if (sequence_position(21)) image_index = 7;
else if (sequence_position(24)) image_index = 8;
else if (sequence_position(26)) sequence_moment = 3;
