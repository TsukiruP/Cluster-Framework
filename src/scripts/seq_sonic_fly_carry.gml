/// seq_sonic_fly_carry()

if (sequence_position(0))
{
    sprite_index = spr_sonic_fly_carry;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(2, 17, 11, 14);
    hitbox_set_attackbox();
}
else if (sequence_position(5)) image_index = 1;
else if (sequence_position(10)) image_index = 2;
else if (sequence_position(15)) image_index = 3;
else if (sequence_position(20)) image_index = 4;
else if (sequence_position(25)) image_index = 5;
else if (sequence_position(30)) image_index = 6;
else if (sequence_position(35)) image_index = 7;
else if (sequence_position(39)) sequence_moment = 0;