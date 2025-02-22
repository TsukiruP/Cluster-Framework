/// sequence_sonic_spin_dash()

if (sequence_position(0))
{
    sprite_index = spr_sonic_spin_dash;
    image_index = 0;
    player_set_radii(6, 9, 3, 5);
    hitbox_set_hurtbox(8, 8, 8, 8);
    hitbox_set_attackbox(8, 8, 8, 8);
}
else if (sequence_position(2)) image_index = 1;
else if (sequence_position(4)) image_index = 2;
else if (sequence_position(6)) image_index = 3;
else if (sequence_position(7)) sequence_moment = 0;