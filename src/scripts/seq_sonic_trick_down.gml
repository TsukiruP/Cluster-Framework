/// seq_sonic_trick_down()

if (sequence_position(0))
{
    sprite_index = spr_sonic_trick_down;
    image_index = 0;
    player_set_radii(6, 9, 3, 5);
    hitbox_set_hurtbox(6, 16, 6, 14);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(12)) image_index = 3;
else if (sequence_position(14)) image_index = 4;
else if (sequence_position(16))
{
    image_index = 5;
    hitbox_set_hurtbox(8, 8, 8, 8);
    hitbox_set_attackbox(8, 8, 8, 8);
}
else if (sequence_position(18)) image_index = 6;
else if (sequence_position(20)) image_index = 7;
else if (sequence_position(22))
{
    sprite_index = spr_sonic_roll;
    image_index = 0;
    animation_trigger = true;
}
else if (sequence_position(24)) image_index = 1;
else if (sequence_position(26)) image_index = 2;
else if (sequence_position(28)) image_index = 3;
else if (sequence_position(29)) sequence_moment = 22;