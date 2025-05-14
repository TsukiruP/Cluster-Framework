/// seq_miles_tail_swipe()

if (sequence_position(0))
{
    sprite_index = spr_miles_tail_swipe;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox();
}
else if (sequence_position(2))
{
    image_index = 1;
    hitbox_set_hurtbox(2, 10, 10, 16);
}
else if (sequence_position(4))
{
    image_index = 2;
    hitbox_set_hurtbox(0, 10, 12, 16);
}
else if (sequence_position(6))
{
    image_index = 3;
    hitbox_set_hurtbox(6, 10, 6, 16);
    hitbox_set_attackbox(-6, 10, 27, 16);
}
else if (sequence_position(8))
{
    image_index = 4;
    hitbox_set_hurtbox(-2, 10, 14, 16);
    hitbox_set_attackbox(-12, 10, 48, 16);
}
else if (sequence_position(10))
{
    image_index = 5;
    hitbox_set_hurtbox(-2, 10, 14, 16);
    hitbox_set_attackbox(-14, 10, 40, 16);
}
else if (sequence_position(12))
{
    image_index = 6;
    hitbox_set_hurtbox(6, 10, 6, 16);
}
else if (sequence_position(15))
{
    image_index = 7;
    hitbox_set_hurtbox(4, 10, 8, 16);
}
else if (sequence_position(18))
{
    image_index = 8;
    hitbox_set_hurtbox(6, 10, 6, 16);
}
else if (sequence_position(21)) animation_trigger = true;
