/// seq_sonic_trick_up_flight()

if (sequence_position(0))
{
    sprite_index = spr_sonic_trick_up;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 14);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(9)) image_index = 2;
else if (sequence_position(11))
{
    image_index = 3;
    animation_trigger = true;
}
else if (sequence_position(12)) image_index = 4;
else if (sequence_position(13)) image_index = 5;
else if (sequence_position(16)) image_index = 6;
else if (sequence_position(19)) image_index = 7;
else if (sequence_position(21)) sequence_moment = 13;