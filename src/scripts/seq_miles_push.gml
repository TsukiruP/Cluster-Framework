/// seq_miles_push()

if (sequence_position(0))
{
    sprite_index = spr_miles_push;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(4)) image_index = 1;
else if (sequence_position(11)) image_index = 2;
else if (sequence_position(18)) image_index = 3;
else if (sequence_position(25)) image_index = 4;
else if (sequence_position(32)) image_index = 5;
else if (sequence_position(39)) image_index = 6;
else if (sequence_position(46)) image_index = 7;
else if (sequence_position(53)) image_index = 8;
else if (sequence_position(59)) sequence_moment = 4;