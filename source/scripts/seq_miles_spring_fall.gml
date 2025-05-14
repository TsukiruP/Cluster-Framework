/// seq_miles_spring_fall()

if (animation_skip)
{
    sprite_index = spr_miles_spring;
    sequence_skip(16);
    player_set_radii(6, 14, 3);
}

if (sequence_position(0))
{
    sprite_index = spr_miles_spring;
    image_index = 3;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 16, 6, 6);
    hitbox_set_attackbox();
}
else if (sequence_position(2))
{
    image_index = 4;
    hitbox_set_hurtbox(6, 18, 6, 4);
}
else if (sequence_position(5)) image_index = 5;
else if (sequence_position(8)) image_index = 6;
else if (sequence_position(12))
{
    image_index = 7;
    hitbox_set_hurtbox(6, 20, 6, 2);
}
else if (sequence_position(16))
{
    image_index = 8;
    hitbox_set_hurtbox(6, 18, 6, 2);
}
else if (sequence_position(20))
{
    image_index = 9;
    hitbox_set_hurtbox(6, 20, 6, 2);
}
else if (sequence_position(23)) image_index = 10;
else if (sequence_position(26)) image_index = 11;
else if (sequence_position(28)) sequence_moment = 20;