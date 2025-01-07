/// ctl_classic_hurt()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_classic_misc;
    image_index = 0;

    // Set collision:
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}
