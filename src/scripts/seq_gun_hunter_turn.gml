/// seq_gun_hunter_turn()

if (sequence_position(0))
{
    sprite_index = spr_gun_hunter;
    image_index = 6;
    image_xscale *= -1;
    hitbox_set_hurtbox(15, 11, 12, 21);
    hitbox_set_attackbox(8, 10, 6, 17);
    sequence_set(seq_gun_hunter_move);
}