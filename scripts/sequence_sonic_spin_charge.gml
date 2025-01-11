/// sequence_sonic_spin_charge()

if (sequence_position(0))
{
    sprite_index = spr_sonic_spin_charge;
    image_index = 0;
    radii_set(6, 9, 3, 5);
    hurtbox_set(8, 8, 8, 8);
    hitbox_set(8, 8, 8, 8);
}

else if (sequence_position(2))
{
    image_index = 1;
}

else if (sequence_position(4))
{
    image_index = 2;
}

else if (sequence_position(6))
{
    image_index = 3;
}

else if (sequence_position(8))
{
    player_set_animation("spin_dash");
}
