/// seq_miles_tag_crouch()

if (sequence_position(0))
{
    sprite_index = spr_miles_tag_crouch;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(1)) image_index = 1;
else if (sequence_position(2)) image_index = 2;
else if (sequence_position(3))
{
    image_index = 3;
    animation_trigger = true;
}
else if (sequence_position(9)) image_index = 4;
else if (sequence_position(15)) image_index = 5;
else if (sequence_position(21)) image_index = 6;
else if (sequence_position(27)) image_index = 7;
else if (sequence_position(33)) image_index = 8;
else if (sequence_position(39)) image_index = 9;
else if (sequence_position(45)) image_index = 10;
else if (sequence_position(51)) image_index = 11;
else if (sequence_position(57)) image_index = 12;
else if (sequence_position(63)) image_index = 13;
else if (sequence_position(69)) image_index = 14;
else if (sequence_position(75)) image_index = 15;
else if (sequence_position(81)) image_index = 16;
else if (sequence_position(87)) image_index = 17;
else if (sequence_position(83)) image_index = 18;
else if (sequence_position(98)) sequence_moment = 9;
