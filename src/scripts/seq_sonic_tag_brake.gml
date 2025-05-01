/// seq_sonic_tag_brake()

if (sequence_position(0))
{
    sprite_index = spr_sonic_tag_brake;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 15);
    hitbox_set_attackbox();
}
else if (sequence_position(2))
{
    image_index = 1;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 13, 6, 15);
    hitbox_set_attackbox();
}
else if (sequence_position(5)) image_index = 2;
else if (sequence_position(7)) sequence_moment = 2;
