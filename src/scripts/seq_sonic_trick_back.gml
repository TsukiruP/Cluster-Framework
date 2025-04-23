/// seq_sonic_trick_back()

if (sequence_position(0))
{
    sprite_index = spr_sonic_trick_back;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 14);
    hitbox_set_attackbox();
}
else if (sequence_position(1)) animation_trigger = true;
else if (sequence_position(5)) image_index = 1;
else if (sequence_position(9)) image_index = 2;
else if (sequence_position(12)) image_index = 3;
else if (sequence_position(14)) image_index = 4;
else if (sequence_position(16)) image_index = 5;
else if (sequence_position(18)) image_index = 6;
else if (sequence_position(20)) image_index = 7;
else if (sequence_position(22)) image_index = 8;
else if (sequence_position(25)) image_index = 9;
else if (sequence_position(28)) image_index = 10;
else if (sequence_position(30)) sequence_moment = 22;
