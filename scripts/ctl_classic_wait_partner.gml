/// ctl_classic_wait_partner()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_classic_wait;
    image_index = 3;

    // Set collision:
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(24))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(30))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(36))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(42))
{
    image_index = 10;
}

// Change frame:
else if (ctl_position(48))
{
    image_index = 11;
}

// Change frame:
else if (ctl_position(54))
{
    image_index = 12;
}

// Change frame:
else if (ctl_position(60))
{
    image_index = 13;
}

// Change frame:
else if (ctl_position(66))
{
    image_index = 14;
}

// Loop animation:
else if (ctl_position(71))
{
    ctl_moment = 72;
}
