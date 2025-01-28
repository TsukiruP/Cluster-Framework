/// sequence_sonic_turn_brake()

if (sequence_position(0))
{
    sprite_index = spr_sonic_turn_brake;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(5, 16, 7, 15, -9);
    hitbox_set();
}
else if (sequence_position(2)) image_index = 1;
else if (sequence_position(4)) image_index = 2;
else if (sequence_position(6)) image_index = 3;
else if (sequence_position(8)) animation_finished = true;
