/// ctl_shield_invin_spark()

// Start effect:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_shield_invin_spark;
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

// Change frame:
else if (ctl_position(16))
{
    image_index = 8;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 9;
}

// Change frame:
else if (ctl_position(20))
{
    image_index = 10;
}

// Change frame:
else if (ctl_position(22))
{
    image_index = 11;
}

// Finish effect:
else if (ctl_position(24))
{
    instance_destroy();
}
