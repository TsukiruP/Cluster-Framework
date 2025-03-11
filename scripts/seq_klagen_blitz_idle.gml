/// seq_klagen_blitz_idle()

if (sequence_position(0))
{
    sprite_index = spr_klagen_blitz;
    image_index = 0;
    attackbox_element = ELEM_NONE;
    y_offset = 0;
    hitbox_set_hurtbox(12, 12, 12, 12);
    hitbox_set_attackbox(10, 2, 10, 14);
}
else if (sequence_position(12))
{
    image_index = 1;
    y_offset = 1;
}
else if (sequence_position(24))
{
    image_index = 0;
    y_offset = 2;
}
else if (sequence_position(36))
{
    image_index = 2;
    y_offset = 3;
    klagen_count += 1;
}
else if (sequence_position(48))
{
    image_index = 0;
    y_offset = 4;
}
else if (sequence_position(60))
{
    image_index = 1;
    y_offset = 3;
}
else if (sequence_position(72))
{
    image_index = 0;
    y_offset = 2;
}
else if (sequence_position(84))
{
    image_index = 2;
    y_offset = 1;
}
else if (sequence_position(95)) sequence_moment = 0;
