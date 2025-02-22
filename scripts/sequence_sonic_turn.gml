/// sequence_sonic_turn()

if (sequence_position(0))
{
    sprite_index = spr_sonic_turn;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(5, 16, 7, 15);
    hitbox_set_attackbox();
}
else if (sequence_position(1)) image_index = 1;
else if (sequence_position(2)) animation_trigger = true;