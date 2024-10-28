/// ctl_sonic_skid_end()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_crouch;
    image_index = 3;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(6, 6, 6, 15);
    hitbox_set();
}

// Change frame:
else if (ctl_position(1))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(2))
{
    image_index = 0;
}

// Finish animation:
else if (ctl_position(3))
{
    animation_finished = true;
}
