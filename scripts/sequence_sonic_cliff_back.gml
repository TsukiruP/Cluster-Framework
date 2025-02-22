/// sequence_sonic_cliff_back()

if (sequence_position(0))
{
    sprite_index = spr_sonic_cliff_back;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 13, 6, 15);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(7)) image_index = 2;
else if (sequence_position(11)) image_index = 3;
else if (sequence_position(15)) image_index = 4;
else if (sequence_position(19)) image_index = 5;
else if (sequence_position(23)) image_index = 6;
else if (sequence_position(27)) image_index = 7;
else if (sequence_position(31)) image_index = 8;
else if (sequence_position(34)) sequence_moment = 3;