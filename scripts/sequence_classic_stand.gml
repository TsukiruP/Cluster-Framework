/// sequence_classic_stand()

if (sequence_position(0))
{
    sprite_index = spr_classic_stand;
    image_index = 0;
    player_set_radii(6, 12, 3);
    hitbox_set_hurtbox(6, 12, 6, 11);
    hitbox_set_attackbox();
}
