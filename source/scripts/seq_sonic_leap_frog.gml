/// seq_sonic_leap_frog()

if (sequence_position(0))
{
    sprite_index = spr_sonic_leap_frog;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(14, 17, -2, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(4))
{
    image_index = 1;
    hitbox_set_hurtbox(10, 17, 2, 16);
}
else if (sequence_position(8))
{
    image_index = 2;
    hitbox_set_hurtbox(-2, 28, 14, 2);
}
else if (sequence_position(12)) animation_trigger = true;
