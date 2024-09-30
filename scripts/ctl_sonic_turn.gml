/// ctl_sonic_turn()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_turn;
    image_index = 0;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(8, 16, 4, 15);
    set_hitbox();
}

// Change frame:
else if (ctl_position(2))
{
    image_index = 1;
}

// Finish animation:
else if (ctl_position(3))
{
    animation_finished = true;
}
