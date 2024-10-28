/// ctl_sonic_insta()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_sonic_insta;
    image_index = 0;

    // Set collision:
    radii_set(6, 9, 3, 5);
    hurtbox_set(8, 8, 8, 8);
    hitbox_set(14, 14, 14, 14);
}

// Change frame:
else if (ctl_position(1))
{
    image_index = 1;
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

// Change frame:
else if (ctl_position(4))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(5))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(7))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(8))
{
    sprite_index = spr_sonic_roll;
    image_index = 0;
}

// Change frame:
else if (ctl_position(10))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(14))
{
    image_index = 3;
}

// Change animation:
else if (ctl_position(16))
{
    player_set_animation("spin", 4);
}
