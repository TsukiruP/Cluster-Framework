/// ctl_classic_spring()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_classic_spring;
    image_index = 1;

    // Set collision:
    radii_set(6, 12, 3);
    hurtbox_set(6, 12, 6, 11);
    hitbox_set();
}
