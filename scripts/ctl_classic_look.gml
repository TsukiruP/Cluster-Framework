/// ctl_classic_look()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_classic_stand;
    image_index = 1;

    // Set collision:
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();

    // Animation trigger:
    animation_trigger = true;
}
