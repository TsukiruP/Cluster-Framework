/// ctl_shield_bubble_bound()

// Start effect:
if (ctl_position(0)) {
    sprite_index = spr_shield_bubble_shell;
    image_index  = 0;
}

// Change frame:
else if (ctl_position(6)) {
    sprite_index = spr_shield_bubble_bound;
    image_index  = 0;
}
