/// ctl_checkpoint_inactive()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_checkpoint;
    image_index = 0;
}

// Change frame:
else if (ctl_position(6))
{
    image_index = 1;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 2;
}

// Change frame:
else if (ctl_position(18))
{
    image_index = 3;
}

// Change frame:
else if (ctl_position(24))
{
    image_index = 4;
}

// Change frame:
else if (ctl_position(30))
{
    image_index = 5;
}

// Loop animation:
else if (ctl_position(35))
{
    ctl_moment = 0;
}
