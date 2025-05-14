/// seq_sonic_crouch()

if (sequence_position(0))
{
    sprite_index = spr_sonic_crouch;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 6, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(1))
{
    image_index = 1;
    animation_trigger = true;
}
else if (sequence_position(2)) image_index = 2;
else if (sequence_position(3)) image_index = 3;