/// player_afterimage_create()
/// @desc Returns the id of a new afterimage instance.
/// @returns {object}

var afterimage_inst; afterimage_inst = instance_create(floor(x), floor(y), eff_afterimage);

with (afterimage_inst)
{
    sprite_index = other.sprite_index;
    image_index = other.image_index;
    image_xscale = other.image_xscale;
    image_yscale = other.image_yscale;
    image_angle = other.image_angle;
    image_alpha = 0.9;
    depth = other.depth + 1;
}

return afterimage_inst;
