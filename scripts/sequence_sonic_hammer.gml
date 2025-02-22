/// sequence_sonic_hammer()

if (sequence_position(0))
{
    sprite_index = spr_sonic_hammer;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 13, 6, 15);
    hitbox_set_attackbox();
}
else if (sequence_position(1))
{
    image_index = 1;
    hitbox_set_hurtbox(6, 13, 6, 15, -9);
}
else if (sequence_position(2))
{
    image_index = 2;
    hitbox_set_hurtbox(6, 13, 6, 15, -16);
}
else if (sequence_position(3)) image_index = 3;
else if (sequence_position(4)) image_index = 4;
else if (sequence_position(6)) image_index = 5;
else if (sequence_position(9))
{
    image_index = 6;
    hitbox_set_hurtbox(6, 13, 6, 15, -11);
}
else if (sequence_position(10))
{
    image_index = 7;
    hitbox_set_hurtbox(6, 13, 6, 15, -8);
    hitbox_set_attackbox(15, 15, 15, 18, 3, -20);
}
else if (sequence_position(11))
{
    image_index = 8;
    hitbox_set_hurtbox(6, 13, 6, 15);
    hitbox_set_attackbox(16, 23, 16, 15, 16);
}
else if (sequence_position(13)) image_index = 9;
else if (sequence_position(15)) image_index = 10;
else if (sequence_position(17)) image_index = 11;
else if (sequence_position(20))
{
    image_index = 12;
    hitbox_set_attackbox();
}
else if (sequence_position(23)) image_index = 13;
else if (sequence_position(26)) animation_trigger = true;