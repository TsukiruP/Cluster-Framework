/// ctl_sonic_land()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_land;
    image_index = 0;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 16, 6, 15);
    hitbox_set();
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(10))
{
    image_index = 2;
}

// Change animation:
else if (ctl_position(18))
{
    player_set_animation("stand");
}
