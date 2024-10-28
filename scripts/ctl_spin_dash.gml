/// ctl_spin_dash()

// Start effect:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_spin_dash;
    image_index = 0;
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

// Change frame:
else if (ctl_position(8))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(10))
{
    image_index = 5;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 6;
}

// Change frame:
else if (ctl_position(14))
{
    image_index = 7;
}

// Loop effect:
else if (ctl_position(15))
{
    ctl_time = 0;
}
