/// ctl_sonic_turn_brake()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_turn_brake;
    image_index = 0;

    // Set collision:
    radii_set(6, 14, 3);
    hurtbox_set(4, 16, 8, 15);
    hitbox_set();
}

// Change frame:
else if (ctl_position(2))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(4))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 3;
}

// Finish animation:
else if (ctl_position(8))
{
    animation_finished = true;
}
