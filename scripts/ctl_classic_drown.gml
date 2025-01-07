/// ctl_classic_drown()

// Start animation:
if (ctl_position(0))
{
    // Set sprite:
    sprite_index = spr_classic_death;
    image_index = 1;

    // Set collision:
    radii_set();
    hurtbox_set();
    hitbox_set();
}
