/// ctl_explosion_large()

// Start effect:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_explosion_large;
    image_index = 0;
}

// Change frame:
else if (ctl_position(3))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(10))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(14))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(22))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(27))
{
    image_index = 7;
}

// Change frame:
else if (ctl_position(32))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(38))
{
    image_index = 9;
}

// Finish effect:
else if (ctl_position(44))
{
    instance_destroy();
}
