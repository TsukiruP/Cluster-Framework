/// sequence_sonic_stomp()

if (sequence_position(0))
{
    sprite_index = spr_sonic_stomp;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 15);
    hitbox_set_attackbox();
}
else if (sequence_position(1)) image_index = 1;
else if (sequence_position(2)) image_index = 2;
else if (sequence_position(3)) image_index = 3;
else if (sequence_position(4)) image_index = 4;
else if (sequence_position(5)) image_index = 5;
else if (sequence_position(6))
{
    image_index = 6;
    hitbox_set_attackbox(5, 5, 20, 20);
}
else if (sequence_position(7))
{
    image_index = 7;
    sequence_moment = 6;
}
