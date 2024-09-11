/// ctl_ring_sparkle()

// Start effect:
if (ctl_position(0))
{
    sprite_index = spr_ring_sparkle;
    image_index  = 0;
}

// Change frame:
else if (ctl_position(4))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(8))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 3;
}

// Finish effect:
else if (ctl_position(16))
{
    instance_destroy();
}
