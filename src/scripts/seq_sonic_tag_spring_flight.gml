/// seq_sonic_tag_spring_flight()

if (sequence_position(0))
{
    sprite_index = spr_sonic_tag_spring;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(3)) image_index = 1;
else if (sequence_position(6)) image_index = 2;
else if (sequence_position(8)) sequence_moment = 3;