/// sequence_sonic_breathe()

if (sequence_position(0))
{
    sprite_index = spr_sonic_breathe;
    image_index = 0;
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
    hitbox_set();
}
else if (sequence_position(6)) image_index = 1;
