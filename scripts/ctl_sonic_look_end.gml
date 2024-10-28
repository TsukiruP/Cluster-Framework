/// ctl_sonic_look_end()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_look;
    image_index = 1;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 13, 6, 15);
    hitbox_set();
}

// Change frame:
else if (ctl_position(2))
{
    image_index = 0;
}

// Change animation:
else if (ctl_position(4))
{
    player_set_animation("stand");
}
