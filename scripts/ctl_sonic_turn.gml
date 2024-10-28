/// ctl_sonic_turn()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_turn;
    image_index = 0;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(8, 16, 4, 15);
    hitbox_set();
}

// Change frame:
else if (ctl_position(1))
{
    image_index = 1;
}

// Finish animation:
else if (ctl_position(2))
{
    animation_finished = true;
}
