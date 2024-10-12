/// ctl_sonic_crouch()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_crouch;
    image_index = 0;

    // Set collision:
    player_set_radii(6, 14, 3);
    set_hurtbox(6, 6, 6, 15);
    set_hitbox();
}

// Change frame:
else if (ctl_position(1))
{
    image_index = 1;

    // Animation trigger:
    animation_trigger = true;
}

// Change frame:
else if (ctl_position(2))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(3))
{
    image_index = 3;
}
