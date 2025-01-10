/// ctl_classic_drown()

if (ctl_position(0))
{
    sprite_index = spr_classic_death;
    image_index = 1;
    radii_set();
    hurtbox_set();
    hitbox_set();
}
