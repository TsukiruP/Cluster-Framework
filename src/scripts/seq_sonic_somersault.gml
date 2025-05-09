/// seq_sonic_somersault()

if (sequence_position(0))
{
    sprite_index = spr_sonic_skid;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 6, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(2))
{
    image_index = 1;
    hitbox_set_hurtbox(10, 6, 10, 16);
    hitbox_set_attackbox(6, 20, 23, 16);
}
else if (sequence_position(4)) image_index = 2;
else if (sequence_position(6)) image_index = 3;
else if (sequence_position(7)) image_index = 4;
else if (sequence_position(8)) image_index = 5;
else if (sequence_position(9)) image_index = 6;
else if (sequence_position(10)) image_index = 7;
else if (sequence_position(11)) image_index = 8;
else if (sequence_position(12)) image_index = 9;
else if (sequence_position(13)) image_index = 10;
else if (sequence_position(14)) animation_trigger = true;