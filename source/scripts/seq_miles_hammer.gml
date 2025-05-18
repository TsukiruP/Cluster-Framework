/// seq_miles_hammer()

if (sequence_position(0))
{
    sprite_index = spr_miles_hammer;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(1)) image_index = 1;
else if (sequence_position(2))
{
    image_index = 2;
    hitbox_set_hurtbox(8, 10, 4, 16);
}
else if (sequence_position(3))
{
    image_index = 3;
    hitbox_set_hurtbox(10, 10, 2, 16);
}
else if (sequence_position(5)) image_index = 4;
else if (sequence_position(7)) image_index = 5;
else if (sequence_position(10)) image_index = 6;
else if (sequence_position(11))
{
    image_index = 7;
    hitbox_set_attackbox(8, 36, 20, -5);
}
else if (sequence_position(12))
{
    image_index = 8;
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox(-2, 23, 34, 16);
}
else if (sequence_position(14)) image_index = 9;
else if (sequence_position(16)) image_index = 10;
else if (sequence_position(18))
{
    image_index = 11;
    hitbox_set_attackbox();
}
else if (sequence_position(21)) image_index = 12;
else if (sequence_position(24)) image_index = 13;
else if (sequence_position(27)) image_index = 14;
else if (sequence_position(30)) animation_trigger = true;
