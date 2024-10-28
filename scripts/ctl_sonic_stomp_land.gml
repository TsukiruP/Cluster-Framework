/// ctl_sonic_stomp_land()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_stomp;
    image_index = 8;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 16, 6, 15);
    set_hitbox();
}

// Change frame:
else if (ctl_position(5))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(9))
{
    image_index = 10;
}

// Change frame:
else if (ctl_position(13))
{
    image_index = 11;
}

// Finish animation:
else if (ctl_position(16))
{
    animation_finished = true;
}
