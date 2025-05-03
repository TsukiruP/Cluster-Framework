/// seq_miles_trick_front_fall()

if (sequence_position(0))
{
    sprite_index = spr_miles_trick_front;
    image_index = 17;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 12, 6, 10);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 18;
else if (sequence_position(6)) image_index = 19;
else if (sequence_position(9)) image_index = 20;
else if (sequence_position(11)) sequence_moment = 3;
