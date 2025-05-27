/// seq_miles_jump_box()

if (sequence_position(0))
{
    sprite_index = spr_miles_jump_box;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(2)) image_index = 1;
else if (sequence_position(4)) image_index = 2;
else if (sequence_position(6)) image_index = 3;
else if (sequence_position(8)) image_index = 4;
else if (sequence_position(12)) image_index = 5;
else if (sequence_position(16)) image_index = 6;
else if (sequence_position(20)) image_index = 7;
else if (sequence_position(24)) image_index = 8;
else if (sequence_position(28)) image_index = 9;
else if (sequence_position(32)) image_index = 10;
else if (sequence_position(36)) image_index = 11;
else if (sequence_position(40)) image_index = 12;
else if (sequence_position(42)) image_index = 13;
else if (sequence_position(44)) image_index = 14;
else if (sequence_position(46)) image_index = 15;
else if (sequence_position(48)) animation_trigger = true;
