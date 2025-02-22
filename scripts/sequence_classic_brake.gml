/// sequence_classic_brake()

if (sequence_position(0))
{
    sprite_index = spr_classic_brake;
    image_index = 0;
    player_set_radii(6, 12, 3);
    hitbox_set_hurtbox(6, 12, 6, 11);
    hitbox_set_attackbox();
}
else if (sequence_position(8)) image_index = 1;
else if (sequence_position(15)) sequence_moment = 0;