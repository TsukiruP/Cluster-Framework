/// sequence_sonic_look()

if (sequence_position(0))
{
    sprite_index = spr_sonic_look;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 13, 6, 15);
    hitbox_set_attackbox();
}
else if (sequence_position(4))
{
    image_index = 1;
    animation_trigger = true;
}
else if (sequence_position(8)) image_index = 2;
else if (sequence_position(20)) image_index = 3;
else if (sequence_position(32)) image_index = 2;
else if (sequence_position(44)) image_index = 4;
else if (sequence_position(55)) sequence_moment = 8;