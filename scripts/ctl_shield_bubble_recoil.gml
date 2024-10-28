/// ctl_shield_bubble_recoil()

// Start effect:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_shield_bubble_bound;
    image_index = 1;
}

// Change frame:
else if (ctl_position(12))
{
    image_index = 0;
}

// Change effect:
else if (ctl_position(17))
{
    timeline_set(ctl_shield_bubble);
}
