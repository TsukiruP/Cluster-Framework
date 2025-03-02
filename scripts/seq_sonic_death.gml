/// seq_sonic_death()

if (sequence_position(0))
{
    sprite_index = spr_sonic_death;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 15);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(18)) image_index = 3;
else if (sequence_position(20)) image_index = 4;
else if (sequence_position(23)) image_index = 5;
else if (sequence_position(25)) sequence_moment = 20;
