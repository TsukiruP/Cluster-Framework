/// seq_classic_breathe()

if (sequence_position(0))
{
    sprite_index = spr_classic_misc;
    image_index = 2;
    player_set_radii(6, 12, 3);
    hitbox_set_hurtbox(6, 12, 6, 11);
    hitbox_set_attackbox();
}
