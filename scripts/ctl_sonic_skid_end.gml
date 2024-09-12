/// ctl_sonic_skid_end()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_crouch;
    image_index = 3;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 6, 6, 15);
    set_hitbox();
}

// Change frame:
else if (ctl_position(1))
{
    image_index = 1;
}

// Finish animation:
else if (ctl_position(2))
{
    image_index = 0;
    animation_finished = true;
}
