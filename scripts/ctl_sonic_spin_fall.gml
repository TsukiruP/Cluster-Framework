/// ctl_sonic_spin_fall()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_spin_fall;
    image_index  = 0;

    // Set collision:
    player_set_radii(6, 9, 3, 5);
    set_hurtbox(6, 6, 6, 4);
    set_hitbox(6, 9, 6, 9);
}

// Change frame:
else if (ctl_position(1))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(3))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(5))
{
    image_index = 3;
}

// Null frame:
else if (ctl_position(6))
{
    ctl_time = 1;
}
