/// seq_sonic_wait_partner()

if (sequence_position(0))
{
    sprite_index = spr_sonic_wait_partner;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(8)) image_index = 1;
else if (sequence_position(16)) image_index = 2;
else if (sequence_position(24)) image_index = 3;
else if (sequence_position(32)) image_index = 4;
else if (sequence_position(40)) image_index = 5;
else if (sequence_position(48)) image_index = 3;
else if (sequence_position(56)) image_index = 4;
else if (sequence_position(64)) image_index = 5;
else if (sequence_position(72)) image_index = 3;
else if (sequence_position(80)) image_index = 4;
else if (sequence_position(88)) image_index = 5;
else if (sequence_position(96)) image_index = 3;
else if (sequence_position(112)) image_index = 2;
else if (sequence_position(120)) image_index = 6;
else if (sequence_position(128)) image_index = 7;
else if (sequence_position(170)) image_index = 8;
else if (sequence_position(178)) image_index = 9;
else if (sequence_position(186)) image_index = 10;
else if (sequence_position(194)) image_index = 11;
else if (sequence_position(202)) image_index = 10;
else if (sequence_position(210)) image_index = 9;
else if (sequence_position(270)) image_index = 2;
else if (sequence_position(277)) sequence_moment = 24;