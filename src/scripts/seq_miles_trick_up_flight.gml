/// seq_miles_trick_up_flight()

if (sequence_position(0))
{
    sprite_index = spr_miles_trick_up;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 12, 6, 10);
    hitbox_set_attackbox();
}
else if (sequence_position(2)) image_index = 1;
else if (sequence_position(3)) image_index = 2;
else if (sequence_position(4))
{
    image_index = 3;
    animation_trigger = true;
}
else if (sequence_position(12)) image_index = 4;
else if (sequence_position(15)) image_index = 5;
else if (sequence_position(19)) image_index = 6;
else if (sequence_position(23)) image_index = 7;
else if (sequence_position(27)) image_index = 8;
else if (sequence_position(30)) sequence_moment = 19;
