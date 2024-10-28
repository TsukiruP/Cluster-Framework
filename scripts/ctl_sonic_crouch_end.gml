/// ctl_sonic_crouch_end()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_crouch;
    image_index = 1;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 6, 6, 15);
    hitbox_set();
}

// Change frame:
else if (ctl_position(1))
{
    image_index = 0;
}

// Change animation:
else if (ctl_position(2))
{
    player_set_animation("stand");
}
