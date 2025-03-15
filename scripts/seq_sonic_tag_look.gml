/// seq_sonic_tag_look()

if (sequence_position(0))
{
    sprite_index = spr_sonic_tag_look;
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
