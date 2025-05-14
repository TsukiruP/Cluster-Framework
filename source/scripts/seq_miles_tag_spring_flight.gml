/// seq_miles_tag_spring_flight()

if (sequence_position(0))
{
    sprite_index = spr_miles_tag_spring;
    image_index = 0;
    player_set_radii(6, 14, 3);
    hitbox_set_hurtbox(6, 12, 6, 10);
    hitbox_set_attackbox();
}
else if (sequence_position(2)) image_index = 1;
else if (sequence_position(4)) image_index = 2;
else if (sequence_position(5)) sequence_moment = 0;
