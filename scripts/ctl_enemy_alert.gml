/// ctl_enemy_alert()

// Start effect:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_enemy_alert;
    image_index = 0;
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

// Finish effect:
else if (ctl_position(12))
{
    instance_destroy();
}
