/// seq_miles_fly_hammer_attack()

if (sequence_position(0))
{
    sprite_index = spr_miles_fly_hammer;
    image_index = 8;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(7, 14, 6, 6);
    hitbox_set_attackbox();
}
else if (sequence_position(1)) image_index = 9;
else if (sequence_position(2)) image_index = 10;
else if (sequence_position(3)) image_index = 11;
else if (sequence_position(5)) image_index = 12;
else if (sequence_position(8)) image_index = 13;
else if (sequence_position(9))
{
    image_index = 14;
    hitbox_set_attackbox(-4, 28, 38, 7);
}
else if (sequence_position(10))
{
    image_index = 15;
    hitbox_set_attackbox(15, 13, 31, 28);
}
else if (sequence_position(12)) image_index = 16;
else if (sequence_position(14)) image_index = 17;
else if (sequence_position(16)) image_index = 18;
else if (sequence_position(18)) image_index = 19;
else if (sequence_position(20)) image_index = 20;
else if (sequence_position(22)) image_index = 21;
else if (sequence_position(24)) image_index = 22;
else if (sequence_position(26)) miles_animation_fly();
