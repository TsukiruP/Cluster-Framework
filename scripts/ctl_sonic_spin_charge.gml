/// ctl_sonic_spin_charge()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_spin_charge;
    image_index  = 0;

    // Set collision:
    player_set_radii(6, 9, 3, 5);
    set_hurtbox(8, 8, 8, 8);
    set_hitbox(8, 8, 8, 8);
}

// Change frame:
else if (ctl_position(2))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(4))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 3;
}

// Null frame:
else if (ctl_position(7))
{
    player_set_animation("spin_dash");
}
