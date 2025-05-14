/// seq_miles_tag_look()

if (sequence_position(0))
{
    sprite_index = spr_miles_tag_look;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6))
{
    image_index = 2;
    animation_trigger = true;
}
else if (sequence_position(9)) image_index = 3;
else if (sequence_position(15)) image_index = 4;
else if (sequence_position(21)) image_index = 5;
else if (sequence_position(27)) image_index = 6;
else if (sequence_position(33)) image_index = 7;
else if (sequence_position(39)) image_index = 8;
else if (sequence_position(45)) image_index = 9;
else if (sequence_position(51)) image_index = 10;
else if (sequence_position(56)) sequence_moment = 9;
