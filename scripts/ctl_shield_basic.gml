/// ctl_shield_basic()

// Start effect:
if (ctl_position(0))
{
    sprite_index = spr_shield_basic;
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
else if (ctl_position(9))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(15))
{
    image_index = 5;
}

// Loop effect:
else if (ctl_position(17))
{
    ctl_time = 0;
}
